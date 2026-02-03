import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/enums/ai_category.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class DetectionBoundingBox extends Equatable {
  const DetectionBoundingBox({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.normalized,
  });

  final double left;
  final double top;
  final double right;
  final double bottom;
  final bool normalized;

  @override
  List<Object?> get props => [left, top, right, bottom, normalized];
}

class Detection extends Equatable {
  const Detection({
    required this.id,
    required this.caseId,
    required this.sessionId,
    required this.category,
    required this.confidence,
    required this.boundingBox,
    required this.detectedAt,
    this.evidenceId,
    this.videoOffset,
  });

  final DetectionId id;
  final CaseId caseId;
  final RecordingSessionId sessionId;
  final EvidenceId? evidenceId;
  final AiCategory category;
  final double confidence;
  final DetectionBoundingBox boundingBox;
  final Timestamp detectedAt;
  final Duration? videoOffset;

  @override
  List<Object?> get props => [
        id,
        caseId,
        sessionId,
        evidenceId,
        category,
        confidence,
        boundingBox,
        detectedAt,
        videoOffset,
      ];
}
