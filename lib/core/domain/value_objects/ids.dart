import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

abstract class Identifier extends Equatable {
  const Identifier(this.value);

  final String value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}

class CaseId extends Identifier {
  const CaseId(super.value);
}

class EvidenceId extends Identifier {
  const EvidenceId(super.value);
}

class OfficerId extends Identifier {
  const OfficerId(super.value);
}

class AuditEventId extends Identifier {
  const AuditEventId(super.value);
}

class RecordingSessionId extends Identifier {
  const RecordingSessionId(super.value);
}

class VideoSegmentId extends Identifier {
  const VideoSegmentId(super.value);
}

class DeviceId extends Identifier {
  const DeviceId(super.value);
}

class DetectionId extends Identifier {
  const DetectionId(super.value);
}

class ReportId extends Identifier {
  const ReportId(super.value);
}

class IdFactory {
  IdFactory._();

  // UUIDv4 provides offline, collision-resistant identifiers without a server.
  static const Uuid _uuid = Uuid();

  static CaseId newCaseId() => CaseId(_uuid.v4());

  static EvidenceId newEvidenceId() => EvidenceId(_uuid.v4());

  static OfficerId newOfficerId() => OfficerId(_uuid.v4());

  static AuditEventId newAuditEventId() => AuditEventId(_uuid.v4());

  static RecordingSessionId newRecordingSessionId() =>
      RecordingSessionId(_uuid.v4());

  static VideoSegmentId newVideoSegmentId() => VideoSegmentId(_uuid.v4());

  static DeviceId newDeviceId() => DeviceId(_uuid.v4());

  static DetectionId newDetectionId() => DetectionId(_uuid.v4());

  static ReportId newReportId() => ReportId(_uuid.v4());
}
