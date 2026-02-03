import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/chain_of_custody/domain/entities/audit_event.dart';

abstract class AuditRepository {
  Future<void> appendEvent(AuditEvent event);

  Future<List<AuditEvent>> listEvents(CaseId caseId);

  Future<AuditEvent?> latestEvent(CaseId caseId);
}
