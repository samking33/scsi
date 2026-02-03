import 'package:drift/drift.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/timeline/domain/entities/timeline_entry.dart';
import 'package:scsi/features/timeline/domain/repositories/timeline_repository.dart';

class TimelineRepositoryImpl implements TimelineRepository {
  TimelineRepositoryImpl(this._db);

  final ScsiDatabase _db;

  @override
  Future<void> addEntry(TimelineEntry entry) async {
    await _db.into(_db.timelineEntries).insert(
          TimelineEntriesCompanion.insert(
            id: entry.id,
            caseId: entry.caseId.value,
            sessionId: entry.sessionId.value,
            type: entry.type.name,
            occurredAt: entry.occurredAt.epochMillis,
            videoOffsetMs: entry.videoOffset.inMilliseconds,
            evidenceId: Value(entry.evidenceId?.value),
            segmentId: Value(entry.segmentId?.value),
            detectionId: Value(entry.detectionId?.value),
          ),
        );
  }

  @override
  Future<List<TimelineEntry>> listEntries(CaseId caseId) async {
    final rows = await (_db.select(_db.timelineEntries)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.occurredAt)]))
        .get();
    return rows.map(_mapEntry).toList();
  }

  TimelineEntry _mapEntry(TimelineEntryRecord row) {
    return TimelineEntry(
      id: row.id,
      caseId: CaseId(row.caseId),
      sessionId: RecordingSessionId(row.sessionId),
      type: TimelineEntryType.values.firstWhere(
        (value) => value.name == row.type,
        orElse: () => TimelineEntryType.note,
      ),
      occurredAt: Timestamp.from(
        DateTime.fromMillisecondsSinceEpoch(row.occurredAt, isUtc: true),
      ),
      videoOffset: Duration(milliseconds: row.videoOffsetMs),
      evidenceId: row.evidenceId == null ? null : EvidenceId(row.evidenceId!),
      segmentId: row.segmentId == null ? null : VideoSegmentId(row.segmentId!),
      detectionId:
          row.detectionId == null ? null : DetectionId(row.detectionId!),
    );
  }
}
