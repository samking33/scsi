import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'scsi_database.g.dart';

@DataClassName('CaseRecord')
class Cases extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get jurisdiction => text().nullable()();
  IntColumn get createdAt => integer()();

  TextColumn get officerId => text()();
  TextColumn get officerName => text()();
  TextColumn get officerBadge => text()();
  TextColumn get officerAgency => text()();
  TextColumn get officerRank => text()();

  TextColumn get deviceId => text()();
  TextColumn get deviceManufacturer => text()();
  TextColumn get deviceModel => text()();
  TextColumn get deviceOsVersion => text()();
  TextColumn get deviceAppVersion => text()();

  RealColumn get initialLat => real()();
  RealColumn get initialLng => real()();
  RealColumn get initialAlt => real().nullable()();
  RealColumn get initialAccuracy => real().nullable()();
  RealColumn get initialHeading => real().nullable()();
  RealColumn get initialSpeed => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RecordingSessionRecord')
class RecordingSessions extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  IntColumn get startedAt => integer()();
  TextColumn get startedBy => text()();
  IntColumn get endedAt => integer().nullable()();
  TextColumn get endedBy => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('VideoSegmentRecord')
class VideoSegments extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  TextColumn get filePath => text()();
  TextColumn get sha256 => text()();
  IntColumn get sizeBytes => integer()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
  IntColumn get startOffsetMs => integer()();
  IntColumn get endOffsetMs => integer()();
  BoolColumn get finalized => boolean().withDefault(const Constant(true))();
  BoolColumn get abrupt => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('EvidenceItemRecord')
class EvidenceItems extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  TextColumn get sessionId => text()();
  TextColumn get capturedBy => text()();
  IntColumn get capturedAt => integer()();
  IntColumn get videoOffsetMs => integer()();

  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get altitude => real().nullable()();
  RealColumn get accuracy => real().nullable()();
  RealColumn get heading => real().nullable()();
  RealColumn get speed => real().nullable()();

  TextColumn get type => text()();
  TextColumn get filePath => text().nullable()();
  TextColumn get sha256 => text().nullable()();
  IntColumn get sizeBytes => integer().nullable()();
  TextColumn get mimeType => text().nullable()();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
  IntColumn get durationMs => integer().nullable()();
  TextColumn get noteText => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DetectionRecord')
class Detections extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  TextColumn get sessionId => text()();
  TextColumn get evidenceId => text().nullable()();
  TextColumn get category => text()();
  RealColumn get confidence => real()();
  RealColumn get bboxLeft => real()();
  RealColumn get bboxTop => real()();
  RealColumn get bboxRight => real()();
  RealColumn get bboxBottom => real()();
  BoolColumn get bboxNormalized => boolean()();
  IntColumn get detectedAt => integer()();
  IntColumn get videoOffsetMs => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AuditEventRecord')
class AuditEvents extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  IntColumn get sequence => integer()();
  TextColumn get action => text()();
  IntColumn get occurredAt => integer()();
  TextColumn get detailsJson => text()();
  TextColumn get previousHash => text()();
  TextColumn get hash => text()();
  TextColumn get actorId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TimelineEntryRecord')
class TimelineEntries extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  TextColumn get sessionId => text()();
  TextColumn get type => text()();
  IntColumn get occurredAt => integer()();
  IntColumn get videoOffsetMs => integer()();
  TextColumn get evidenceId => text().nullable()();
  TextColumn get segmentId => text().nullable()();
  TextColumn get detectionId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('OfficerPathPointRecord')
class OfficerPathPoints extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sessionId => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get altitude => real().nullable()();
  RealColumn get accuracy => real().nullable()();
  RealColumn get heading => real().nullable()();
  RealColumn get speed => real().nullable()();
  IntColumn get timestamp => integer()();
}

@DataClassName('ReportRecord')
class Reports extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  IntColumn get generatedAt => integer()();
  TextColumn get filePath => text()();
  TextColumn get sha256 => text()();
  IntColumn get sizeBytes => integer()();
  BoolColumn get passwordProtected => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Cases,
    RecordingSessions,
    VideoSegments,
    EvidenceItems,
    Detections,
    AuditEvents,
    TimelineEntries,
    OfficerPathPoints,
    Reports,
  ],
)
class ScsiDatabase extends _$ScsiDatabase {
  ScsiDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dir.path, 'scsi.sqlite'));
    return NativeDatabase.createInBackground(dbFile);
  });
}
