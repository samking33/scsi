import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/entities/device_info.dart';
import 'package:scsi/core/domain/entities/officer.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class CaseFile extends Equatable {
  const CaseFile({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.leadOfficer,
    required this.createdOnDevice,
    required this.initialLocation,
    this.description,
    this.jurisdiction,
  });

  final CaseId id;
  final String title;
  final String? description;
  final String? jurisdiction;
  final Timestamp createdAt;
  final Officer leadOfficer;
  final DeviceInfo createdOnDevice;
  final GeoLocation initialLocation;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        jurisdiction,
        createdAt,
        leadOfficer,
        createdOnDevice,
        initialLocation,
      ];
}
