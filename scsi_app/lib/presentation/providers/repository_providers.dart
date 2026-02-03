import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/database_manager.dart';
import '../../data/repositories/case_repository_impl.dart';
import '../../data/repositories/evidence_repository_impl.dart';
import '../../data/repositories/chain_of_custody_repository_impl.dart';
import '../../domain/repositories/case_repository.dart';
import '../../domain/repositories/evidence_repository.dart';
import '../../domain/repositories/chain_of_custody_repository.dart';

final databaseManagerProvider = Provider<DatabaseManager>((ref) {
  return DatabaseManager();
});

final caseRepositoryProvider = Provider<CaseRepository>((ref) {
  final dbManager = ref.watch(databaseManagerProvider);
  return CaseRepositoryImpl(dbManager);
});

final evidenceRepositoryProvider = Provider<EvidenceRepository>((ref) {
  final dbManager = ref.watch(databaseManagerProvider);
  return EvidenceRepositoryImpl(dbManager);
});

final chainOfCustodyRepositoryProvider = Provider<ChainOfCustodyRepository>((ref) {
  final dbManager = ref.watch(databaseManagerProvider);
  return ChainOfCustodyRepositoryImpl(dbManager);
});
