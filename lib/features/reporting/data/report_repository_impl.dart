import 'package:drift/drift.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/value_objects/encrypted_file_ref.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/reporting/domain/entities/report_bundle.dart';
import 'package:scsi/features/reporting/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  ReportRepositoryImpl(this._db);

  final ScsiDatabase _db;

  @override
  Future<void> addReport(ReportBundle report) async {
    await _db.into(_db.reports).insert(
          ReportsCompanion.insert(
            id: report.id.value,
            caseId: report.caseId.value,
            generatedAt: report.generatedAt.epochMillis,
            filePath: report.pdfFile.path,
            sha256: report.pdfFile.sha256.hex,
            sizeBytes: report.pdfFile.sizeBytes,
            passwordProtected: Value(report.passwordProtected),
          ),
        );
  }

  @override
  Future<List<ReportBundle>> listReports(CaseId caseId) async {
    final rows = await (_db.select(_db.reports)
          ..where((tbl) => tbl.caseId.equals(caseId.value))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.generatedAt)]))
        .get();
    return rows.map(_mapReport).toList();
  }

  ReportBundle _mapReport(ReportRecord row) {
    return ReportBundle(
      id: ReportId(row.id),
      caseId: CaseId(row.caseId),
      generatedAt: Timestamp.from(
        DateTime.fromMillisecondsSinceEpoch(row.generatedAt, isUtc: true),
      ),
      pdfFile: EncryptedFileRef(
        path: row.filePath,
        sizeBytes: row.sizeBytes,
        sha256: HashDigest(row.sha256),
        createdAt: Timestamp.from(
          DateTime.fromMillisecondsSinceEpoch(row.generatedAt, isUtc: true),
        ),
      ),
      passwordProtected: row.passwordProtected,
    );
  }
}
