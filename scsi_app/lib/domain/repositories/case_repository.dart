import '../entities/case.dart';

abstract class CaseRepository {
  /// Create a new case
  Future<void> createCase(Case newCase);
  
  /// Get case details by ID
  Future<Case?> getCaseById(String id);
  
  /// Update case status
  Future<void> updateCaseStatus(String id, CaseStatus status);
  
  /// Close case
  Future<void> closeCase(String id);
}
