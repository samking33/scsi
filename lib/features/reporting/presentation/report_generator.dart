import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:scsi/features/ai_detection/domain/entities/detection.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/services/file_hash_service.dart';
import 'package:scsi/features/ai_detection/domain/repositories/detection_repository.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';
import 'package:scsi/features/chain_of_custody/domain/repositories/audit_repository.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/domain/repositories/evidence_repository.dart';
import 'package:scsi/features/reporting/domain/entities/report_bundle.dart';

class ReportGenerator {
  ReportGenerator({
    required EvidenceRepository evidenceRepository,
    required DetectionRepository detectionRepository,
    required AuditRepository auditRepository,
    required FileHashService fileHashService,
  })  : _evidenceRepository = evidenceRepository,
        _detectionRepository = detectionRepository,
        _auditRepository = auditRepository,
        _fileHashService = fileHashService;

  final EvidenceRepository _evidenceRepository;
  final DetectionRepository _detectionRepository;
  final AuditRepository _auditRepository;
  final FileHashService _fileHashService;

  Future<ReportBundle> generate({
    required CaseFile caseFile,
  }) async {
    final evidence = await _evidenceRepository.listEvidence(caseFile.id);
    final detections = await _detectionRepository.listDetections(caseFile.id);
    final audit = await _auditRepository.listEvents(caseFile.id);

    final photoEvidence = evidence.whereType<PhotoEvidence>().toList();
    final photoImages = await _loadPhotoThumbnails(photoEvidence, limit: 6);
    final detectionSummary = _summarizeDetections(detections);

    final doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Text('Smart CSI Report', style: pw.TextStyle(fontSize: 24)),
          pw.SizedBox(height: 12),
          pw.Text('Case ID: ${caseFile.id.value}'),
          pw.Text('Title: ${caseFile.title}'),
          if (caseFile.description != null)
            pw.Text('Description: ${caseFile.description}'),
          if (caseFile.jurisdiction != null)
            pw.Text('Jurisdiction: ${caseFile.jurisdiction}'),
          pw.Text('Created At (UTC): ${caseFile.createdAt.utc.toIso8601String()}'),
          pw.Text('Lead Officer: ${caseFile.leadOfficer.fullName}'),
          pw.SizedBox(height: 16),
          pw.Text('Evidence Summary', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 8),
          ...evidence.map((item) => pw.Text(_describeEvidence(item))),
          if (photoImages.isNotEmpty) ...[
            pw.SizedBox(height: 16),
            pw.Text('Photo Evidence', style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 8),
            pw.Wrap(
              spacing: 8,
              runSpacing: 8,
              children: photoImages
                  .map((img) => pw.Container(
                        width: 160,
                        height: 120,
                        child: pw.Image(img, fit: pw.BoxFit.cover),
                      ))
                  .toList(),
            ),
          ],
          pw.SizedBox(height: 16),
          pw.Text('Map Snapshot', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 8),
          _buildMapPlot(evidence),
          pw.SizedBox(height: 16),
          pw.Text('AI Detections', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 8),
          if (detectionSummary.isNotEmpty)
            ...detectionSummary.entries.map(
              (entry) => pw.Text('${entry.key}: ${entry.value}'),
            ),
          ...detections.map(
            (det) => pw.Text(
              '${det.category.name} (${(det.confidence * 100).toStringAsFixed(1)}%)',
            ),
          ),
          pw.SizedBox(height: 16),
          pw.Text('Chain of Custody', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 8),
          ...audit.map(
            (event) => pw.Text(
              '${event.sequence}. ${event.action.name} @ ${event.occurredAt.utc.toIso8601String()}',
            ),
          ),
        ],
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final reportsDir = Directory(p.join(dir.path, 'reports', caseFile.id.value));
    if (!reportsDir.existsSync()) {
      reportsDir.createSync(recursive: true);
    }
    final fileName = 'report_${DateTime.now().toUtc().millisecondsSinceEpoch}.pdf';
    final file = File(p.join(reportsDir.path, fileName));
    await file.writeAsBytes(await doc.save());

    final ref = await _fileHashService.toFileRef(file.path);
    return ReportBundle(
      id: IdFactory.newReportId(),
      caseId: caseFile.id,
      generatedAt: ref.createdAt,
      pdfFile: ref,
      passwordProtected: false,
    );
  }

  Future<List<pw.MemoryImage>> _loadPhotoThumbnails(
    List<PhotoEvidence> photos, {
    int limit = 6,
  }) async {
    final result = <pw.MemoryImage>[];
    for (final photo in photos.take(limit)) {
      final file = File(photo.file.path);
      if (!await file.exists()) continue;
      final bytes = await file.readAsBytes();
      result.add(pw.MemoryImage(bytes));
    }
    return result;
  }

  Map<String, int> _summarizeDetections(List<Detection> detections) {
    final summary = <String, int>{};
    for (final det in detections) {
      summary.update(det.category.name, (value) => value + 1, ifAbsent: () => 1);
    }
    return summary;
  }

  String _describeEvidence(EvidenceItem item) {
    if (item is PhotoEvidence) {
      return 'Photo @ ${item.capturedAt.utc.toIso8601String()} (${item.file.sizeBytes} bytes)';
    }
    if (item is AudioEvidence) {
      return 'Audio @ ${item.capturedAt.utc.toIso8601String()} (${item.duration.inSeconds}s)';
    }
    if (item is NoteEvidence) {
      return 'Note @ ${item.capturedAt.utc.toIso8601String()}: ${item.text}';
    }
    if (item is VideoSegmentEvidence) {
      return 'Video segment @ ${item.capturedAt.utc.toIso8601String()}';
    }
    return 'Evidence @ ${item.capturedAt.utc.toIso8601String()}';
  }

  pw.Widget _buildMapPlot(List<EvidenceItem> evidence) {
    if (evidence.isEmpty) {
      return pw.Text('No location data available.');
    }
    final lats = evidence.map((e) => e.location.latitude).toList();
    final lngs = evidence.map((e) => e.location.longitude).toList();
    final minLat = lats.reduce(min);
    final maxLat = lats.reduce(max);
    final minLng = lngs.reduce(min);
    final maxLng = lngs.reduce(max);
    final spanLat = maxLat - minLat;
    final spanLng = maxLng - minLng;

    return pw.Container(
      height: 180,
      width: double.infinity,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey),
      ),
      child: pw.CustomPaint(
        painter: (canvas, size) {
          canvas
            ..setFillColor(PdfColors.blue)
            ..setLineWidth(1);
          for (final item in evidence) {
            final x = spanLng == 0
                ? size.x / 2
                : ((item.location.longitude - minLng) / spanLng) * size.x;
            final y = spanLat == 0
                ? size.y / 2
                : size.y -
                    ((item.location.latitude - minLat) / spanLat) * size.y;
            canvas.drawEllipse(x, y, 3, 3);
            canvas.fillPath();
          }
        },
      ),
    );
  }
}
