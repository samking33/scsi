import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/services/device_info_service.dart';
import 'package:scsi/core/services/location_service.dart';
import 'package:scsi/core/settings/settings_repository.dart';
import 'package:scsi/core/services/file_hash_service.dart';
import 'package:scsi/features/ai_detection/data/detection_repository_impl.dart';
import 'package:scsi/features/ai_detection/domain/repositories/detection_repository.dart';
import 'package:scsi/features/case_management/data/case_repository_impl.dart';
import 'package:scsi/features/case_management/domain/repositories/case_repository.dart';
import 'package:scsi/features/chain_of_custody/data/audit_repository_impl.dart';
import 'package:scsi/features/chain_of_custody/domain/repositories/audit_repository.dart';
import 'package:scsi/features/evidence/data/evidence_repository_impl.dart';
import 'package:scsi/features/evidence/data/recording_repository_impl.dart';
import 'package:scsi/features/evidence/domain/repositories/evidence_repository.dart';
import 'package:scsi/features/evidence/domain/repositories/recording_repository.dart';
import 'package:scsi/features/geospatial/data/geospatial_repository_impl.dart';
import 'package:scsi/features/geospatial/domain/repositories/geospatial_repository.dart';
import 'package:scsi/features/reporting/data/report_repository_impl.dart';
import 'package:scsi/features/reporting/domain/repositories/report_repository.dart';
import 'package:scsi/features/timeline/data/timeline_repository_impl.dart';
import 'package:scsi/features/timeline/domain/repositories/timeline_repository.dart';
import 'package:scsi/features/evidence/presentation/evidence_capture_service.dart';

final databaseProvider = Provider<ScsiDatabase>((ref) {
  final db = ScsiDatabase();
  ref.onDispose(db.close);
  return db;
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository();
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final deviceInfoServiceProvider = Provider<DeviceInfoService>((ref) {
  return DeviceInfoService();
});

final fileHashServiceProvider = Provider<FileHashService>((ref) {
  return FileHashService();
});

final evidenceCaptureServiceProvider = Provider<EvidenceCaptureService>((ref) {
  return EvidenceCaptureService(ref.read(fileHashServiceProvider));
});

final caseRepositoryProvider = Provider<CaseRepository>((ref) {
  return CaseRepositoryImpl(ref.read(databaseProvider));
});

final evidenceRepositoryProvider = Provider<EvidenceRepository>((ref) {
  return EvidenceRepositoryImpl(ref.read(databaseProvider));
});

final recordingRepositoryProvider = Provider<RecordingRepository>((ref) {
  return RecordingRepositoryImpl();
});

final detectionRepositoryProvider = Provider<DetectionRepository>((ref) {
  final settings = ref.read(settingsRepositoryProvider);
  return DetectionRepositoryImpl(
    database: ref.read(databaseProvider),
    settingsRepository: settings,
  );
});

final auditRepositoryProvider = Provider<AuditRepository>((ref) {
  return AuditRepositoryImpl(ref.read(databaseProvider));
});

final timelineRepositoryProvider = Provider<TimelineRepository>((ref) {
  return TimelineRepositoryImpl(ref.read(databaseProvider));
});

final geospatialRepositoryProvider = Provider<GeospatialRepository>((ref) {
  return GeospatialRepositoryImpl(ref.read(databaseProvider));
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepositoryImpl(ref.read(databaseProvider));
});
