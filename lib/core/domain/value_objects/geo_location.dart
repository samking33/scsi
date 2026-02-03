import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class GeoLocation extends Equatable {
  const GeoLocation({
    required this.latitude,
    required this.longitude,
    this.altitudeMeters,
    this.accuracyMeters,
    this.headingDegrees,
    this.speedMetersPerSecond,
    required this.timestamp,
  });

  final double latitude;
  final double longitude;
  final double? altitudeMeters;
  final double? accuracyMeters;
  final double? headingDegrees;
  final double? speedMetersPerSecond;
  final Timestamp timestamp;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        altitudeMeters,
        accuracyMeters,
        headingDegrees,
        speedMetersPerSecond,
        timestamp,
      ];
}
