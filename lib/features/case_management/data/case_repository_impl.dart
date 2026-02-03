import 'package:drift/drift.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/entities/device_info.dart';
import 'package:scsi/core/domain/entities/officer.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';
import 'package:scsi/features/case_management/domain/repositories/case_repository.dart';

class CaseRepositoryImpl implements CaseRepository {
  CaseRepositoryImpl(this._db);

  final ScsiDatabase _db;

  @override
  Future<void> addCase(CaseFile caseFile) async {
    await _db.into(_db.cases).insert(
          CasesCompanion.insert(
            id: caseFile.id.value,
            title: caseFile.title,
            description: Value(caseFile.description),
            jurisdiction: Value(caseFile.jurisdiction),
            createdAt: caseFile.createdAt.epochMillis,
            officerId: caseFile.leadOfficer.id.value,
            officerName: caseFile.leadOfficer.fullName,
            officerBadge: caseFile.leadOfficer.badgeNumber,
            officerAgency: caseFile.leadOfficer.agency,
            officerRank: caseFile.leadOfficer.rank,
            deviceId: caseFile.createdOnDevice.deviceId.value,
            deviceManufacturer: caseFile.createdOnDevice.manufacturer,
            deviceModel: caseFile.createdOnDevice.model,
            deviceOsVersion: caseFile.createdOnDevice.osVersion,
            deviceAppVersion: caseFile.createdOnDevice.appVersion,
            initialLat: caseFile.initialLocation.latitude,
            initialLng: caseFile.initialLocation.longitude,
            initialAlt: Value(caseFile.initialLocation.altitudeMeters),
            initialAccuracy: Value(caseFile.initialLocation.accuracyMeters),
            initialHeading: Value(caseFile.initialLocation.headingDegrees),
            initialSpeed: Value(caseFile.initialLocation.speedMetersPerSecond),
          ),
        );
  }

  @override
  Future<CaseFile?> getCase(CaseId caseId) async {
    final row = await (_db.select(_db.cases)
          ..where((tbl) => tbl.id.equals(caseId.value)))
        .getSingleOrNull();
    if (row == null) return null;
    return _mapCase(row);
  }

  @override
  Future<List<CaseFile>> listCases() async {
    final rows = await (_db.select(_db.cases)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
    return rows.map(_mapCase).toList();
  }

  CaseFile _mapCase(CaseRecord row) {
    final officer = Officer(
      id: OfficerId(row.officerId),
      fullName: row.officerName,
      badgeNumber: row.officerBadge,
      agency: row.officerAgency,
      rank: row.officerRank,
    );

    final device = DeviceInfo(
      deviceId: DeviceId(row.deviceId),
      manufacturer: row.deviceManufacturer,
      model: row.deviceModel,
      osVersion: row.deviceOsVersion,
      appVersion: row.deviceAppVersion,
    );

    final location = GeoLocation(
      latitude: row.initialLat,
      longitude: row.initialLng,
      altitudeMeters: row.initialAlt,
      accuracyMeters: row.initialAccuracy,
      headingDegrees: row.initialHeading,
      speedMetersPerSecond: row.initialSpeed,
      timestamp: Timestamp.from(DateTime.fromMillisecondsSinceEpoch(row.createdAt, isUtc: true)),
    );

    return CaseFile(
      id: CaseId(row.id),
      title: row.title,
      description: row.description,
      jurisdiction: row.jurisdiction,
      createdAt: Timestamp.from(DateTime.fromMillisecondsSinceEpoch(row.createdAt, isUtc: true)),
      leadOfficer: officer,
      createdOnDevice: device,
      initialLocation: location,
    );
  }
}
