import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';

abstract class CaseRepository {
  Future<void> addCase(CaseFile caseFile);

  Future<CaseFile?> getCase(CaseId caseId);

  Future<List<CaseFile>> listCases();
}
