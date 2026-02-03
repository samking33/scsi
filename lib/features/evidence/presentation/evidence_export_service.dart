import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/ai_detection/domain/entities/detection.dart';
import 'package:scsi/features/ai_detection/domain/repositories/detection_repository.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';
import 'package:scsi/features/case_management/domain/repositories/case_repository.dart';
import 'package:scsi/features/chain_of_custody/domain/entities/audit_event.dart';
import 'package:scsi/features/chain_of_custody/domain/repositories/audit_repository.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/domain/repositories/evidence_repository.dart';
import 'package:scsi/features/reporting/domain/entities/report_bundle.dart';
import 'package:scsi/features/reporting/domain/repositories/report_repository.dart';
import 'package:scsi/features/timeline/domain/entities/timeline_entry.dart';
import 'package:scsi/features/timeline/domain/repositories/timeline_repository.dart';

class EvidenceExportService {
  EvidenceExportService({
    required CaseRepository caseRepository,
    required EvidenceRepository evidenceRepository,
    required DetectionRepository detectionRepository,
    required TimelineRepository timelineRepository,
    required AuditRepository auditRepository,
    required ReportRepository reportRepository,
  })  : _evidenceRepository = evidenceRepository,
        _caseRepository = caseRepository,
        _detectionRepository = detectionRepository,
        _timelineRepository = timelineRepository,
        _auditRepository = auditRepository,
        _reportRepository = reportRepository;

  final CaseRepository _caseRepository;
  final EvidenceRepository _evidenceRepository;
  final DetectionRepository _detectionRepository;
  final TimelineRepository _timelineRepository;
  final AuditRepository _auditRepository;
  final ReportRepository _reportRepository;

  Future<File> exportCaseBundle(String caseId) async {
    final caseFile = await _caseRepository.getCase(CaseId(caseId));
    final evidence = await _evidenceRepository.listEvidence(CaseId(caseId));
    final detections = await _detectionRepository.listDetections(CaseId(caseId));
    final timeline = await _timelineRepository.listEntries(CaseId(caseId));
    final audit = await _auditRepository.listEvents(CaseId(caseId));
    final reports = await _reportRepository.listReports(CaseId(caseId));

    final manifest = {
      'caseId': caseId,
      'generatedAt': DateTime.now().toUtc().toIso8601String(),
      'case': caseFile == null ? null : _serializeCase(caseFile),
      'evidence': evidence.map(_serializeEvidence).toList(),
      'detections': detections.map(_serializeDetection).toList(),
      'timeline': timeline.map(_serializeTimeline).toList(),
      'audit': audit.map(_serializeAudit).toList(),
      'reports': reports.map(_serializeReport).toList(),
    };

    final archive = Archive();
    final manifestBytes = utf8.encode(const JsonEncoder.withIndent('  ').convert(manifest));
    archive.addFile(ArchiveFile('manifest.json', manifestBytes.length, manifestBytes));

    for (final item in evidence) {
      final filePath = _evidenceFilePath(item);
      if (filePath == null) continue;
      final file = File(filePath);
      if (!await file.exists()) continue;
      final bytes = await file.readAsBytes();
      final name = p.basename(filePath);
      archive.addFile(ArchiveFile('evidence/$name', bytes.length, bytes));
    }

    for (final report in reports) {
      final file = File(report.pdfFile.path);
      if (!await file.exists()) continue;
      final bytes = await file.readAsBytes();
      final name = p.basename(report.pdfFile.path);
      archive.addFile(ArchiveFile('reports/$name', bytes.length, bytes));
    }

    final dir = await getApplicationDocumentsDirectory();
    final outDir = Directory(p.join(dir.path, 'exports', caseId));
    if (!outDir.existsSync()) outDir.createSync(recursive: true);
    final zipPath = p.join(outDir.path, 'case_export_${DateTime.now().millisecondsSinceEpoch}.zip');

    final encoder = ZipEncoder();
    final zipData = encoder.encode(archive);
    final outFile = File(zipPath);
    await outFile.writeAsBytes(zipData ?? []);
    return outFile;
  }

  String? _evidenceFilePath(EvidenceItem item) {
    if (item is PhotoEvidence) return item.file.path;
    if (item is AudioEvidence) return item.file.path;
    if (item is VideoSegmentEvidence) return item.segment.file.path;
    return null;
  }

  Map<String, Object?> _serializeEvidence(EvidenceItem item) {
    return {
      'id': item.id.value,
      'type': item.type.name,
      'capturedAt': item.capturedAt.utc.toIso8601String(),
      'videoOffsetMs': item.videoOffset.inMilliseconds,
      'location': {
        'lat': item.location.latitude,
        'lng': item.location.longitude,
      },
      'filePath': _evidenceFilePath(item),
    };
  }

  Map<String, Object?> _serializeDetection(Detection det) {
    return {
      'id': det.id.value,
      'category': det.category.name,
      'confidence': det.confidence,
      'evidenceId': det.evidenceId?.value,
      'bbox': {
        'left': det.boundingBox.left,
        'top': det.boundingBox.top,
        'right': det.boundingBox.right,
        'bottom': det.boundingBox.bottom,
        'normalized': det.boundingBox.normalized,
      },
      'detectedAt': det.detectedAt.utc.toIso8601String(),
    };
  }

  Map<String, Object?> _serializeTimeline(TimelineEntry entry) {
    return {
      'id': entry.id,
      'type': entry.type.name,
      'occurredAt': entry.occurredAt.utc.toIso8601String(),
      'videoOffsetMs': entry.videoOffset.inMilliseconds,
      'evidenceId': entry.evidenceId?.value,
    };
  }

  Map<String, Object?> _serializeAudit(AuditEvent event) {
    return {
      'id': event.id.value,
      'sequence': event.sequence,
      'action': event.action.name,
      'occurredAt': event.occurredAt.utc.toIso8601String(),
      'hash': event.hash.hex,
      'previousHash': event.previousHash.hex,
      'details': event.details,
    };
  }

  Map<String, Object?> _serializeReport(ReportBundle report) {
    return {
      'id': report.id.value,
      'generatedAt': report.generatedAt.utc.toIso8601String(),
      'filePath': report.pdfFile.path,
      'sha256': report.pdfFile.sha256.hex,
    };
  }

  Map<String, Object?> _serializeCase(CaseFile caseFile) {
    return {
      'id': caseFile.id.value,
      'title': caseFile.title,
      'description': caseFile.description,
      'jurisdiction': caseFile.jurisdiction,
      'createdAt': caseFile.createdAt.utc.toIso8601String(),
      'leadOfficer': {
        'id': caseFile.leadOfficer.id.value,
        'name': caseFile.leadOfficer.fullName,
        'badge': caseFile.leadOfficer.badgeNumber,
        'agency': caseFile.leadOfficer.agency,
        'rank': caseFile.leadOfficer.rank,
      },
      'device': {
        'id': caseFile.createdOnDevice.deviceId.value,
        'manufacturer': caseFile.createdOnDevice.manufacturer,
        'model': caseFile.createdOnDevice.model,
        'osVersion': caseFile.createdOnDevice.osVersion,
        'appVersion': caseFile.createdOnDevice.appVersion,
      },
      'initialLocation': {
        'lat': caseFile.initialLocation.latitude,
        'lng': caseFile.initialLocation.longitude,
        'altitude': caseFile.initialLocation.altitudeMeters,
        'accuracy': caseFile.initialLocation.accuracyMeters,
        'heading': caseFile.initialLocation.headingDegrees,
        'speed': caseFile.initialLocation.speedMetersPerSecond,
      },
    };
  }
}
