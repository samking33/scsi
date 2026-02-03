import 'package:equatable/equatable.dart';
import 'package:scsi/core/crypto/hash_utils.dart';
import 'package:scsi/core/domain/enums/audit_action.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/core/utils/canonical_json.dart';

class AuditEvent extends Equatable {
  const AuditEvent._({
    required this.id,
    required this.caseId,
    required this.sequence,
    required this.action,
    required this.occurredAt,
    required this.details,
    required this.previousHash,
    required this.hash,
    this.actorId,
  });

  final AuditEventId id;
  final CaseId caseId;
  final int sequence;
  final AuditAction action;
  final Timestamp occurredAt;
  final Map<String, Object?> details;
  final HashDigest previousHash;
  final HashDigest hash;
  final OfficerId? actorId;

  static AuditEvent create({
    required AuditEventId id,
    required CaseId caseId,
    required int sequence,
    required AuditAction action,
    required Timestamp occurredAt,
    required Map<String, Object?> details,
    required HashDigest previousHash,
    OfficerId? actorId,
  }) {
    // Canonical JSON prevents hash divergence due to key ordering differences.
    final payload = {
      'id': id.value,
      'caseId': caseId.value,
      'sequence': sequence,
      'action': action.name,
      'occurredAt': occurredAt.utc.toIso8601String(),
      'details': details,
      'previousHash': previousHash.hex,
      'actorId': actorId?.value,
    };

    final canonical = canonicalJsonEncode(payload);
    final hash = sha256String(canonical);

    return AuditEvent._(
      id: id,
      caseId: caseId,
      sequence: sequence,
      action: action,
      occurredAt: occurredAt,
      details: details,
      previousHash: previousHash,
      hash: hash,
      actorId: actorId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        caseId,
        sequence,
        action,
        occurredAt,
        details,
        previousHash,
        hash,
        actorId,
      ];
}
