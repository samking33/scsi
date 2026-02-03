import '../entities/chain_of_custody_log.dart';

abstract class ChainOfCustodyRepository {
  /// Log a new chain of custody event
  Future<void> logEvent(ChainOfCustodyLog log);
  
  /// Get full chain of custody for a case
  Future<List<ChainOfCustodyLog>> getChainForCase(String caseId);
  
  /// Get chain for specific evidence item
  Future<List<ChainOfCustodyLog>> getChainForEvidence(String evidenceId);
  
  /// Verify integrity of the chain
  /// Returns true if all hashes form a valid chain
  Future<bool> verifyChainIntegrity(String caseId);
}
