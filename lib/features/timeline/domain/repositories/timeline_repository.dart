import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/timeline/domain/entities/timeline_entry.dart';

abstract class TimelineRepository {
  Future<void> addEntry(TimelineEntry entry);

  Future<List<TimelineEntry>> listEntries(CaseId caseId);
}
