import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/enums/audit_action.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/chain_of_custody/domain/entities/audit_event.dart';
import 'package:scsi/features/chain_of_custody/domain/repositories/audit_repository.dart';

class AuditRepositoryImpl implements AuditRepository {
  AuditRepositoryImpl(this._db);

  final ScsiDatabase _db;

  @override
  Future<void> appendEvent(AuditEvent event) async {
    await _db.into(_db.auditEvents).insert(
          AuditEventsCompanion.insert(
            id: event.id.value,
            caseId: event.caseId.value,
            sequence: event.sequence,
            action: event.action.name,
            occurredAt: event.occurredAt.epochMillis,
            detailsJson: jsonEncode(event.details),
            previousHash: event.previousHash.hex,
            hash: event.hash.hex,
            actorId: Value(event.actorId?.value),
          ),
        );
  }

  @override
  Future<List<AuditEvent>> listEvents(CaseId caseId) async {
    final rows = await (_db.select(_db.auditEvents)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.sequence)]))
        .get();
    return rows.map(_mapEvent).toList();
  }

  @override
  Future<AuditEvent?> latestEvent(CaseId caseId) async {
    final row = await (_db.select(_db.auditEvents)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.sequence)])
          ..limit(1))
        .getSingleOrNull();
    if (row == null) return null;
    return _mapEvent(row);
  }

  AuditEvent _mapEvent(AuditEventRecord row) {
    return AuditEvent.create(
      id: AuditEventId(row.id),
      caseId: CaseId(row.caseId),
      sequence: row.sequence,
      action: AuditAction.values.firstWhere(
        (value) => value.name == row.action,
        orElse: () => AuditAction.caseViewed,
      ),
      occurredAt: Timestamp.from(
        DateTime.fromMillisecondsSinceEpoch(row.occurredAt, isUtc: true),
      ),
      details: jsonDecode(row.detailsJson) as Map<String, dynamic>,
      previousHash: HashDigest(row.previousHash),
      actorId: row.actorId == null ? null : OfficerId(row.actorId!),
    );
  }
}
