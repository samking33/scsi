import 'package:drift/drift.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/enums/ai_category.dart';
import 'package:scsi/core/domain/enums/evidence_type.dart';
import 'package:scsi/core/domain/value_objects/encrypted_file_ref.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/domain/repositories/evidence_repository.dart';

class EvidenceRepositoryImpl implements EvidenceRepository {
  EvidenceRepositoryImpl(this._db);

  final ScsiDatabase _db;

  @override
  Future<void> addEvidence(EvidenceItem item) async {
    await _db.into(_db.evidenceItems).insert(
          EvidenceItemsCompanion.insert(
            id: item.id.value,
            caseId: item.caseId.value,
            sessionId: item.sessionId.value,
            capturedBy: item.capturedBy.value,
            capturedAt: item.capturedAt.epochMillis,
            videoOffsetMs: item.videoOffset.inMilliseconds,
            latitude: item.location.latitude,
            longitude: item.location.longitude,
            altitude: Value(item.location.altitudeMeters),
            accuracy: Value(item.location.accuracyMeters),
            heading: Value(item.location.headingDegrees),
            speed: Value(item.location.speedMetersPerSecond),
            type: item.type.name,
            filePath: Value(_filePath(item)),
            sha256: Value(_sha256(item)),
            sizeBytes: Value(_sizeBytes(item)),
            mimeType: Value(_mimeType(item)),
            width: Value(_width(item)),
            height: Value(_height(item)),
            durationMs: Value(_durationMs(item)),
            noteText: Value(_noteText(item)),
          ),
        );
  }

  @override
  Future<EvidenceItem?> getEvidence(EvidenceId evidenceId) async {
    final row = await (_db.select(_db.evidenceItems)
          ..where((tbl) => tbl.id.equals(evidenceId.value)))
        .getSingleOrNull();
    if (row == null) return null;
    return _mapEvidence(row);
  }

  @override
  Future<List<EvidenceItem>> listEvidence(CaseId caseId) async {
    final rows = await (_db.select(_db.evidenceItems)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.capturedAt)]))
        .get();
    return rows.map(_mapEvidence).toList();
  }

  @override
  Future<List<EvidenceItem>> searchByDetectedObjects({
    required CaseId caseId,
    required List<AiCategory> categories,
  }) async {
    if (categories.isEmpty) return [];
    final ids = await (_db.select(_db.detections)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..where((tbl) => tbl.category.isIn(categories.map((c) => c.name))))
        .get();
    final evidenceIds = ids
        .map((row) => row.evidenceId)
        .whereType<String>()
        .toSet();

    if (evidenceIds.isEmpty) return [];

    final rows = await (_db.select(_db.evidenceItems)
          ..where((tbl) => tbl.id.isIn(evidenceIds.toList())))
        .get();
    return rows.map(_mapEvidence).toList();
  }

  EvidenceItem _mapEvidence(EvidenceItemRecord row) {
    final location = GeoLocation(
      latitude: row.latitude,
      longitude: row.longitude,
      altitudeMeters: row.altitude,
      accuracyMeters: row.accuracy,
      headingDegrees: row.heading,
      speedMetersPerSecond: row.speed,
      timestamp: Timestamp.from(DateTime.fromMillisecondsSinceEpoch(row.capturedAt, isUtc: true)),
    );
    final capturedAt = Timestamp.from(
      DateTime.fromMillisecondsSinceEpoch(row.capturedAt, isUtc: true),
    );
    final offset = Duration(milliseconds: row.videoOffsetMs);
    final type = EvidenceType.values.firstWhere(
      (value) => value.name == row.type,
      orElse: () => EvidenceType.note,
    );

    switch (type) {
      case EvidenceType.photo:
        return PhotoEvidence(
          id: EvidenceId(row.id),
          caseId: CaseId(row.caseId),
          sessionId: RecordingSessionId(row.sessionId),
          capturedBy: OfficerId(row.capturedBy),
          capturedAt: capturedAt,
          videoOffset: offset,
          location: location,
          file: _fileRefFromRow(row),
          width: row.width ?? 0,
          height: row.height ?? 0,
          mimeType: row.mimeType ?? 'image/jpeg',
        );
      case EvidenceType.audio:
        return AudioEvidence(
          id: EvidenceId(row.id),
          caseId: CaseId(row.caseId),
          sessionId: RecordingSessionId(row.sessionId),
          capturedBy: OfficerId(row.capturedBy),
          capturedAt: capturedAt,
          videoOffset: offset,
          location: location,
          file: _fileRefFromRow(row),
          duration: Duration(milliseconds: row.durationMs ?? 0),
          mimeType: row.mimeType ?? 'audio/m4a',
        );
      case EvidenceType.note:
        return NoteEvidence(
          id: EvidenceId(row.id),
          caseId: CaseId(row.caseId),
          sessionId: RecordingSessionId(row.sessionId),
          capturedBy: OfficerId(row.capturedBy),
          capturedAt: capturedAt,
          videoOffset: offset,
          location: location,
          text: row.noteText ?? '',
        );
      case EvidenceType.videoSegment:
        return VideoSegmentEvidence(
          id: EvidenceId(row.id),
          caseId: CaseId(row.caseId),
          sessionId: RecordingSessionId(row.sessionId),
          capturedBy: OfficerId(row.capturedBy),
          capturedAt: capturedAt,
          videoOffset: offset,
          location: location,
          segment: BackgroundVideoSegment(
            id: VideoSegmentId(row.id),
            sessionId: RecordingSessionId(row.sessionId),
            file: _fileRefFromRow(row),
            startTime: capturedAt,
            endTime: capturedAt,
            startOffset: offset,
            endOffset: offset,
          ),
        );
    }
  }

  EncryptedFileRef _fileRefFromRow(EvidenceItemRecord row) {
    return EncryptedFileRef(
      path: row.filePath ?? '',
      sizeBytes: row.sizeBytes ?? 0,
      sha256: HashDigest(row.sha256 ?? ''),
      createdAt: Timestamp.from(DateTime.fromMillisecondsSinceEpoch(row.capturedAt, isUtc: true)),
    );
  }

  String? _filePath(EvidenceItem item) {
    if (item is PhotoEvidence) return item.file.path;
    if (item is AudioEvidence) return item.file.path;
    if (item is VideoSegmentEvidence) return item.segment.file.path;
    return null;
  }

  String? _sha256(EvidenceItem item) {
    if (item is PhotoEvidence) return item.file.sha256.hex;
    if (item is AudioEvidence) return item.file.sha256.hex;
    if (item is VideoSegmentEvidence) return item.segment.file.sha256.hex;
    return null;
  }

  int? _sizeBytes(EvidenceItem item) {
    if (item is PhotoEvidence) return item.file.sizeBytes;
    if (item is AudioEvidence) return item.file.sizeBytes;
    if (item is VideoSegmentEvidence) return item.segment.file.sizeBytes;
    return null;
  }

  String? _mimeType(EvidenceItem item) {
    if (item is PhotoEvidence) return item.mimeType;
    if (item is AudioEvidence) return item.mimeType;
    return null;
  }

  int? _width(EvidenceItem item) {
    if (item is PhotoEvidence) return item.width;
    return null;
  }

  int? _height(EvidenceItem item) {
    if (item is PhotoEvidence) return item.height;
    return null;
  }

  int? _durationMs(EvidenceItem item) {
    if (item is AudioEvidence) return item.duration.inMilliseconds;
    return null;
  }

  String? _noteText(EvidenceItem item) {
    if (item is NoteEvidence) return item.text;
    return null;
  }
}
