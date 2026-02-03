import '../../domain/entities/case.dart';

class CaseMapper {
  static Map<String, dynamic> toMap(Case caseEntity) {
    return {
      'id': caseEntity.id,
      'officer_id': caseEntity.officerId,
      'officer_name': caseEntity.officerName,
      'officer_badge_number': caseEntity.officerBadgeNumber,
      'case_type': caseEntity.caseType,
      'description': caseEntity.description,
      'start_time': caseEntity.startTime.millisecondsSinceEpoch,
      'end_time': caseEntity.endTime?.millisecondsSinceEpoch,
      'latitude': caseEntity.latitude,
      'longitude': caseEntity.longitude,
      'location_address': caseEntity.locationAddress,
      'status': caseEntity.status.name,
      'timezone_offset': caseEntity.timezoneOffset,
    };
  }
  
  static Case fromMap(Map<String, dynamic> map) {
    return Case(
      id: map['id'] as String,
      officerId: map['officer_id'] as String,
      officerName: map['officer_name'] as String,
      officerBadgeNumber: map['officer_badge_number'] as String,
      caseType: map['case_type'] as String,
      description: map['description'] as String,
      startTime: DateTime.fromMillisecondsSinceEpoch(
        map['start_time'] as int,
        isUtc: true,
      ),
      endTime: map['end_time'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['end_time'] as int, isUtc: true)
          : null,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      locationAddress: map['location_address'] as String,
      status: CaseStatus.values.firstWhere(
        (e) => e.name == map['status'] as String
      ),
      timezoneOffset: map['timezone_offset'] as String,
    );
  }
}
