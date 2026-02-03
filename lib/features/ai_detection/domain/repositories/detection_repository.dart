import 'package:scsi/core/domain/enums/ai_category.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/ai_detection/domain/entities/detection.dart';
import 'dart:io';

abstract class DetectionRepository {
  Future<List<Detection>> analyzeImage({
    required CaseId caseId,
    required RecordingSessionId sessionId,
    EvidenceId? evidenceId,
    required File imageFile,
    Duration? videoOffset,
  });

  Future<void> addDetections(List<Detection> detections);

  Future<List<Detection>> listDetections(CaseId caseId);

  Future<List<Detection>> listDetectionsByCategory({
    required CaseId caseId,
    required List<AiCategory> categories,
  });
}
