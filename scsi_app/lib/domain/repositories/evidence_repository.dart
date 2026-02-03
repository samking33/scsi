import '../entities/evidence.dart';

abstract class EvidenceRepository {
  /// Save new evidence to storage and database
  Future<void> saveEvidence(Evidence evidence);
  
  /// Get all evidence for a specific case
  Future<List<Evidence>> getEvidenceForCase(String caseId);
  
  /// Get evidence by ID
  Future<Evidence?> getEvidenceById(String id);
  
  /// Delete evidence (secure deletion logic handled in implementation)
  Future<void> deleteEvidence(String id);
}
