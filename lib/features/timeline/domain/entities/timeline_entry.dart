import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

enum TimelineEntryType {
  recordingStart,
  recordingStop,
  videoSegment,
  photo,
  audio,
  note,
  aiDetection,
}

class TimelineEntry extends Equatable {
  const TimelineEntry({
    required this.id,
    required this.caseId,
    required this.sessionId,
    required this.type,
    required this.occurredAt,
    required this.videoOffset,
    this.evidenceId,
    this.segmentId,
    this.detectionId,
  });

  final String id;
  final CaseId caseId;
  final RecordingSessionId sessionId;
  final TimelineEntryType type;
  final Timestamp occurredAt;
  final Duration videoOffset;
  final EvidenceId? evidenceId;
  final VideoSegmentId? segmentId;
  final DetectionId? detectionId;

  @override
  List<Object?> get props => [
        id,
        caseId,
        sessionId,
        type,
        occurredAt,
        videoOffset,
        evidenceId,
        segmentId,
        detectionId,
      ];
}
