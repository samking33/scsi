import 'entity.dart';

/// Represents an investigation case
/// Immutable once created - all fields are final
class Case extends Entity {
  final String id; // UUID
  final String officerId;
  final String officerName;
  final String officerBadgeNumber;
  final String caseType;
  final String description;
  final DateTime startTime; // UTC
  final DateTime? endTime; // UTC, null if active
  final double latitude;
  final double longitude;
  final String locationAddress;
  final CaseStatus status;
  final String timezoneOffset; // e.g., "+05:30"
  
  const Case({
    required this.id,
    required this.officerId,
    required this.officerName,
    required this.officerBadgeNumber,
    required this.caseType,
    required this.description,
    required this.startTime,
    this.endTime,
    required this.latitude,
    required this.longitude,
    required this.locationAddress,
    required this.status,
    required this.timezoneOffset,
  });
  
  /// Create a copy with updated fields
  Case copyWith({
    String? id,
    String? officerId,
    String? officerName,
    String? officerBadgeNumber,
    String? caseType,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    double? latitude,
    double? longitude,
    String? locationAddress,
    CaseStatus? status,
    String? timezoneOffset,
  }) {
    return Case(
      id: id ?? this.id,
      officerId: officerId ?? this.officerId,
      officerName: officerName ?? this.officerName,
      officerBadgeNumber: officerBadgeNumber ?? this.officerBadgeNumber,
      caseType: caseType ?? this.caseType,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationAddress: locationAddress ?? this.locationAddress,
      status: status ?? this.status,
      timezoneOffset: timezoneOffset ?? this.timezoneOffset,
    );
  }
  
  /// Duration of the investigation
  Duration get duration {
    final end = endTime ?? DateTime.now().toUtc();
    return end.difference(startTime);
  }
  
  bool get isActive => status == CaseStatus.active;
  bool get isClosed => status == CaseStatus.closed;
}

enum CaseStatus {
  active,
  closed,
}
