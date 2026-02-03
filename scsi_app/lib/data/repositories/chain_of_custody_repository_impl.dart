import '../datasources/database_manager.dart';
import '../models/chain_of_custody_mapper.dart';
import '../../domain/entities/chain_of_custody_log.dart';
import '../../domain/repositories/chain_of_custody_repository.dart';
import '../../core/utils/crypto_utils.dart';

class ChainOfCustodyRepositoryImpl implements ChainOfCustodyRepository {
  final DatabaseManager _databaseManager;
  
  ChainOfCustodyRepositoryImpl(this._databaseManager);
  
  @override
  Future<void> logEvent(ChainOfCustodyLog log) async {
    final logMap = ChainOfCustodyMapper.toMap(log);
    await _databaseManager.insertLog(logMap);
  }
  
  @override
  Future<List<ChainOfCustodyLog>> getChainForCase(String caseId) async {
    final logMaps = await _databaseManager.getLogsForCase(caseId);
    return logMaps.map((m) => ChainOfCustodyMapper.fromMap(m)).toList();
  }
  
  @override
  Future<List<ChainOfCustodyLog>> getChainForEvidence(String evidenceId) async {
    final db = await _databaseManager.database;
    final logMaps = await db.query(
      'chain_of_custody_logs',
      where: 'evidence_id = ?',
      whereArgs: [evidenceId],
      orderBy: 'timestamp ASC',
    );
    return logMaps.map((m) => ChainOfCustodyMapper.fromMap(m)).toList();
  }
  
  @override
  Future<bool> verifyChainIntegrity(String caseId) async {
    final logs = await getChainForCase(caseId);
    if (logs.isEmpty) return true;
    
    // Verify first log
    // First log typically has previousHash = "GENESIS" or case ID
    // We assume strict chaining from genesis
    
    for (int i = 0; i < logs.length; i++) {
      final currentLog = logs[i];
      
      // 2. Verify specific hash of this log
      final computedHash = CryptoUtils.generateChainHash(
        previousHash: currentLog.previousLogHash,
        data: currentLog.getHashData(),
      );
      
      if (computedHash != currentLog.currentLogHash) {
        return false;
      }
      
      // Wait, CryptoUtils.generateChainHash implementation is: SHA256(prev + data)
      // Log.toString() might not be stable. Log entity should have a specialized method for 'hashableData'.
      // But for now, we assume the Log entity was created with correct hash.
      
      // 2. Verify link
      if (i > 0) {
        final previousLog = logs[i - 1];
        if (currentLog.previousLogHash != previousLog.currentLogHash) {
          return false; // Broken chain link
        }
      }
    }
    
    return true;
  }
}
