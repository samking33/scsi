import 'package:scsi/core/domain/enums/ai_category.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';

abstract class EvidenceRepository {
  Future<void> addEvidence(EvidenceItem item);

  Future<EvidenceItem?> getEvidence(EvidenceId evidenceId);

  Future<List<EvidenceItem>> listEvidence(CaseId caseId);

  Future<List<EvidenceItem>> searchByDetectedObjects({
    required CaseId caseId,
    required List<AiCategory> categories,
  });
}
