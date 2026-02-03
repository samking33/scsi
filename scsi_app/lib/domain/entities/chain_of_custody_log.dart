import 'entity.dart';

/// Chain of custody log entry
/// Immutable and hash-chained for tamper detection
class ChainOfCustodyLog extends Entity {
  final String id; // UUID
  final String caseId;
  final String evidenceId;
  final ChainOfCustodyAction action;
  final String officerId;
  final String officerName;
  final DateTime timestamp; // UTC
  final String previousLogHash; // Hash of previous log entry (empty for first)
  final String currentLogHash; // SHA-256 hash of this entry
  final Map<String, dynamic>? metadata; // Additional action-specific data
  
  const ChainOfCustodyLog({
    required this.id,
    required this.caseId,
    required this.evidenceId,
    required this.action,
    required this.officerId,
    required this.officerName,
    required this.timestamp,
    required this.previousLogHash,
    required this.currentLogHash,
    this.metadata,
  });
  
  /// Get data string for hashing (excludes previous hash and current hash)
  String getHashData() {
    return '$id$caseId$evidenceId${action.name}$officerId${timestamp.toIso8601String()}';
  }
  

}

enum ChainOfCustodyAction {
  created,        // Evidence was captured/created
  viewed,         // Evidence was viewed
  exported,       // Evidence was included in a report
  deleteAttempt,  // Attempted deletion (blocked)
  modified,       // Any modification attempt (should never happen)
}
