import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';

class OfficerPathPoint extends Equatable {
  const OfficerPathPoint({
    required this.sessionId,
    required this.location,
  });

  final RecordingSessionId sessionId;
  final GeoLocation location;

  @override
  List<Object?> get props => [sessionId, location];
}
