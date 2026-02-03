import 'package:scsi/core/domain/entities/device_info.dart';
import 'package:scsi/core/domain/entities/officer.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';
import 'package:scsi/features/case_management/domain/repositories/case_repository.dart';

class CreateCaseRequest {
  const CreateCaseRequest({
    required this.title,
    required this.leadOfficer,
    required this.createdOnDevice,
    required this.initialLocation,
    this.description,
    this.jurisdiction,
  });

  final String title;
  final Officer leadOfficer;
  final DeviceInfo createdOnDevice;
  final GeoLocation initialLocation;
  final String? description;
  final String? jurisdiction;
}

class CreateCase {
  const CreateCase(this._repository);

  final CaseRepository _repository;

  Future<CaseFile> call(CreateCaseRequest request) async {
    final caseFile = CaseFile(
      id: IdFactory.newCaseId(),
      title: request.title,
      description: request.description,
      jurisdiction: request.jurisdiction,
      createdAt: Timestamp.nowUtc(),
      leadOfficer: request.leadOfficer,
      createdOnDevice: request.createdOnDevice,
      initialLocation: request.initialLocation,
    );

    await _repository.addCase(caseFile);
    return caseFile;
  }
}
