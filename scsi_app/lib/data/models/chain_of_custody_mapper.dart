import 'dart:convert';
import '../../domain/entities/chain_of_custody_log.dart';

class ChainOfCustodyMapper {
  static Map<String, dynamic> toMap(ChainOfCustodyLog log) {
    return {
      'id': log.id,
      'case_id': log.caseId,
      'evidence_id': log.evidenceId,
      'action': log.action.name,
      'officer_id': log.officerId,
      'officer_name': log.officerName,
      'timestamp': log.timestamp.millisecondsSinceEpoch,
      'previous_log_hash': log.previousLogHash,
      'current_log_hash': log.currentLogHash,
      'metadata': jsonEncode(log.metadata),
    };
  }
  
  static ChainOfCustodyLog fromMap(Map<String, dynamic> map) {
    return ChainOfCustodyLog(
      id: map['id'] as String,
      caseId: map['case_id'] as String,
      evidenceId: map['evidence_id'] as String,
      action: ChainOfCustodyAction.values.firstWhere(
        (e) => e.name == map['action'] as String
      ),
      officerId: map['officer_id'] as String,
      officerName: map['officer_name'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        map['timestamp'] as int,
        isUtc: true,
      ),
      previousLogHash: map['previous_log_hash'] as String,
      currentLogHash: map['current_log_hash'] as String,
      metadata: Map<String, dynamic>.from(
        jsonDecode(map['metadata'] as String) as Map
      ),
    );
  }
}
