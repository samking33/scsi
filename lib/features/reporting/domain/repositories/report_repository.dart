import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/reporting/domain/entities/report_bundle.dart';

abstract class ReportRepository {
  Future<void> addReport(ReportBundle report);

  Future<List<ReportBundle>> listReports(CaseId caseId);
}
