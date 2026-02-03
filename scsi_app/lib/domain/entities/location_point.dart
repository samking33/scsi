import 'entity.dart';

/// Officer location tracking point
class LocationPoint extends Entity {
  final String id;
  final String caseId;
  final double latitude;
  final double longitude;
  final double accuracy; // meters
  final double? altitude;
  final double? speed; // m/s
  final double? heading; // degrees
  final DateTime timestamp; // UTC
  
  const LocationPoint({
    required this.id,
    required this.caseId,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    this.altitude,
    this.speed,
    this.heading,
    required this.timestamp,
  });
}
