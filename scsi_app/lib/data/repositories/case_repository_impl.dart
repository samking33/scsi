import '../datasources/database_manager.dart';
import '../models/case_mapper.dart';
import '../../domain/entities/case.dart';
import '../../domain/repositories/case_repository.dart';

class CaseRepositoryImpl implements CaseRepository {
  final DatabaseManager _databaseManager;
  
  CaseRepositoryImpl(this._databaseManager);
  
  @override
  Future<void> createCase(Case newCase) async {
    final caseMap = CaseMapper.toMap(newCase);
    await _databaseManager.insertCase(caseMap);
  }
  
  @override
  Future<Case?> getCaseById(String id) async {
    final caseMap = await _databaseManager.getCaseById(id);
    if (caseMap != null) {
      return CaseMapper.fromMap(caseMap);
    }
    return null;
  }
  
  @override
  Future<void> updateCaseStatus(String id, CaseStatus status) async {
    final db = await _databaseManager.database;
    await db.update(
      'cases',
      {'status': status.name},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  
  @override
  Future<void> closeCase(String id) async {
    final db = await _databaseManager.database;
    await db.update(
      'cases',
      {
        'status': CaseStatus.closed.name,
        'end_time': DateTime.now().toUtc().millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
