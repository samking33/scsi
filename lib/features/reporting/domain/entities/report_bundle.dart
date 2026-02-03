import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/encrypted_file_ref.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class ReportBundle extends Equatable {
  const ReportBundle({
    required this.id,
    required this.caseId,
    required this.generatedAt,
    required this.pdfFile,
    this.passwordProtected,
  });

  final ReportId id;
  final CaseId caseId;
  final Timestamp generatedAt;
  final EncryptedFileRef pdfFile;
  final bool? passwordProtected;

  @override
  List<Object?> get props => [id, caseId, generatedAt, pdfFile, passwordProtected];
}
