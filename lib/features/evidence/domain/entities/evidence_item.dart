import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/enums/evidence_type.dart';
import 'package:scsi/core/domain/value_objects/encrypted_file_ref.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

abstract class EvidenceItem extends Equatable {
  const EvidenceItem({
    required this.id,
    required this.caseId,
    required this.sessionId,
    required this.capturedBy,
    required this.capturedAt,
    required this.videoOffset,
    required this.location,
  });

  final EvidenceId id;
  final CaseId caseId;
  final RecordingSessionId sessionId;
  final OfficerId capturedBy;
  final Timestamp capturedAt;
  final Duration videoOffset;
  final GeoLocation location;

  EvidenceType get type;
}

class PhotoEvidence extends EvidenceItem {
  const PhotoEvidence({
    required super.id,
    required super.caseId,
    required super.sessionId,
    required super.capturedBy,
    required super.capturedAt,
    required super.videoOffset,
    required super.location,
    required this.file,
    required this.width,
    required this.height,
    required this.mimeType,
  });

  final EncryptedFileRef file;
  final int width;
  final int height;
  final String mimeType;

  @override
  EvidenceType get type => EvidenceType.photo;

  @override
  List<Object?> get props => [
        id,
        caseId,
        sessionId,
        capturedBy,
        capturedAt,
        videoOffset,
        location,
        file,
        width,
        height,
        mimeType,
      ];
}

class AudioEvidence extends EvidenceItem {
  const AudioEvidence({
    required super.id,
    required super.caseId,
    required super.sessionId,
    required super.capturedBy,
    required super.capturedAt,
    required super.videoOffset,
    required super.location,
    required this.file,
    required this.duration,
    required this.mimeType,
  });

  final EncryptedFileRef file;
  final Duration duration;
  final String mimeType;

  @override
  EvidenceType get type => EvidenceType.audio;

  @override
  List<Object?> get props => [
        id,
        caseId,
        sessionId,
        capturedBy,
        capturedAt,
        videoOffset,
        location,
        file,
        duration,
        mimeType,
      ];
}

class NoteEvidence extends EvidenceItem {
  const NoteEvidence({
    required super.id,
    required super.caseId,
    required super.sessionId,
    required super.capturedBy,
    required super.capturedAt,
    required super.videoOffset,
    required super.location,
    required this.text,
  });

  final String text;

  @override
  EvidenceType get type => EvidenceType.note;

  @override
  List<Object?> get props => [
        id,
        caseId,
        sessionId,
        capturedBy,
        capturedAt,
        videoOffset,
        location,
        text,
      ];
}

class VideoSegmentEvidence extends EvidenceItem {
  const VideoSegmentEvidence({
    required super.id,
    required super.caseId,
    required super.sessionId,
    required super.capturedBy,
    required super.capturedAt,
    required super.videoOffset,
    required super.location,
    required this.segment,
  });

  final BackgroundVideoSegment segment;

  @override
  EvidenceType get type => EvidenceType.videoSegment;

  @override
  List<Object?> get props => [
        id,
        caseId,
        sessionId,
        capturedBy,
        capturedAt,
        videoOffset,
        location,
        segment,
      ];
}

class BackgroundVideoSegment extends Equatable {
  const BackgroundVideoSegment({
    required this.id,
    required this.sessionId,
    required this.file,
    required this.startTime,
    required this.endTime,
    required this.startOffset,
    required this.endOffset,
  });

  final VideoSegmentId id;
  final RecordingSessionId sessionId;
  final EncryptedFileRef file;
  final Timestamp startTime;
  final Timestamp endTime;
  final Duration startOffset;
  final Duration endOffset;

  Duration get duration => endOffset - startOffset;

  @override
  List<Object?> get props => [
        id,
        sessionId,
        file,
        startTime,
        endTime,
        startOffset,
        endOffset,
      ];
}

class RecordingSession extends Equatable {
  const RecordingSession({
    required this.id,
    required this.caseId,
    required this.startedAt,
    required this.startedBy,
    this.endedAt,
    this.endedBy,
    this.segments = const [],
  });

  final RecordingSessionId id;
  final CaseId caseId;
  final Timestamp startedAt;
  final OfficerId startedBy;
  final Timestamp? endedAt;
  final OfficerId? endedBy;
  final List<BackgroundVideoSegment> segments;

  bool get isActive => endedAt == null;

  @override
  List<Object?> get props => [
        id,
        caseId,
        startedAt,
        startedBy,
        endedAt,
        endedBy,
        segments,
      ];
}
