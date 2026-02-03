import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/enums/ai_category.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/core/settings/settings_repository.dart';
import 'package:scsi/features/ai_detection/domain/entities/detection.dart';
import 'package:scsi/features/ai_detection/domain/repositories/detection_repository.dart';

class DetectionRepositoryImpl implements DetectionRepository {
  DetectionRepositoryImpl({
    required ScsiDatabase database,
    required SettingsRepository settingsRepository,
  })  : _db = database,
        _settingsRepository = settingsRepository;

  final ScsiDatabase _db;
  final SettingsRepository _settingsRepository;

  @override
  Future<List<Detection>> analyzeImage({
    required CaseId caseId,
    required RecordingSessionId sessionId,
    EvidenceId? evidenceId,
    required File imageFile,
    Duration? videoOffset,
  }) async {
    final settings = await _settingsRepository.load();
    final baseUrl = settings.aiServerBaseUrl;
    final uri = Uri.parse('$baseUrl/detect');

    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    final response = await request.send();
    final body = await response.stream.bytesToString();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException('AI server error: ${response.statusCode} $body');
    }

    final decoded = jsonDecode(body) as Map<String, dynamic>;
    final detections = (decoded['detections'] as List<dynamic>? ?? [])
        .map((item) => _parseDetection(
              caseId: caseId,
              sessionId: sessionId,
              evidenceId: evidenceId,
              videoOffset: videoOffset,
              json: item as Map<String, dynamic>,
            ))
        .toList();

    if (detections.isNotEmpty) {
      await addDetections(detections);
    }

    return detections;
  }

  Detection _parseDetection({
    required CaseId caseId,
    required RecordingSessionId sessionId,
    EvidenceId? evidenceId,
    Duration? videoOffset,
    required Map<String, dynamic> json,
  }) {
    final categoryRaw = (json['category'] as String? ?? 'unknown').toLowerCase();
    final category = AiCategory.values.firstWhere(
      (value) => value.name == categoryRaw,
      orElse: () => AiCategory.unknown,
    );
    final bbox = json['bbox'] as List<dynamic>? ?? const [];
    return Detection(
      id: IdFactory.newDetectionId(),
      caseId: caseId,
      sessionId: sessionId,
      evidenceId: evidenceId,
      category: category,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0,
      boundingBox: DetectionBoundingBox(
        left: (bbox.elementAtOrNull(0) as num?)?.toDouble() ?? 0,
        top: (bbox.elementAtOrNull(1) as num?)?.toDouble() ?? 0,
        right: (bbox.elementAtOrNull(2) as num?)?.toDouble() ?? 0,
        bottom: (bbox.elementAtOrNull(3) as num?)?.toDouble() ?? 0,
        normalized: json['normalized'] as bool? ?? true,
      ),
      detectedAt: Timestamp.nowUtc(),
      videoOffset: videoOffset,
    );
  }

  @override
  Future<void> addDetections(List<Detection> detections) async {
    if (detections.isEmpty) return;
    await _db.batch((batch) {
      batch.insertAll(
        _db.detections,
        detections
            .map(
              (det) => DetectionsCompanion.insert(
                id: det.id.value,
                caseId: det.caseId.value,
                sessionId: det.sessionId.value,
                evidenceId: Value(det.evidenceId?.value),
                category: det.category.name,
                confidence: det.confidence,
                bboxLeft: det.boundingBox.left,
                bboxTop: det.boundingBox.top,
                bboxRight: det.boundingBox.right,
                bboxBottom: det.boundingBox.bottom,
                bboxNormalized: det.boundingBox.normalized,
                detectedAt: det.detectedAt.epochMillis,
                videoOffsetMs: Value(det.videoOffset?.inMilliseconds),
              ),
            )
            .toList(),
      );
    });
  }

  @override
  Future<List<Detection>> listDetections(CaseId caseId) async {
    final rows = await (_db.select(_db.detections)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.detectedAt)]))
        .get();
    return rows.map(_mapDetection).toList();
  }

  @override
  Future<List<Detection>> listDetectionsByCategory({
    required CaseId caseId,
    required List<AiCategory> categories,
  }) async {
    if (categories.isEmpty) return [];
    final rows = await (_db.select(_db.detections)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..where((tbl) => tbl.category.isIn(categories.map((c) => c.name)))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.detectedAt)]))
        .get();
    return rows.map(_mapDetection).toList();
  }

  Detection _mapDetection(DetectionRecord row) {
    return Detection(
      id: DetectionId(row.id),
      caseId: CaseId(row.caseId),
      sessionId: RecordingSessionId(row.sessionId),
      evidenceId: row.evidenceId == null ? null : EvidenceId(row.evidenceId!),
      category: AiCategory.values.firstWhere(
        (value) => value.name == row.category,
        orElse: () => AiCategory.unknown,
      ),
      confidence: row.confidence,
      boundingBox: DetectionBoundingBox(
        left: row.bboxLeft,
        top: row.bboxTop,
        right: row.bboxRight,
        bottom: row.bboxBottom,
        normalized: row.bboxNormalized,
      ),
      detectedAt: Timestamp.from(
        DateTime.fromMillisecondsSinceEpoch(row.detectedAt, isUtc: true),
      ),
      videoOffset: row.videoOffsetMs == null
          ? null
          : Duration(milliseconds: row.videoOffsetMs!),
    );
  }
}

extension on List {
  dynamic elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }
}
