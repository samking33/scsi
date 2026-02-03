import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/domain/value_objects/recording_config.dart';

abstract class RecordingRepository {
  Future<RecordingSession> startSession({
    required CaseId caseId,
    required OfficerId officerId,
    required RecordingConfig config,
  });

  Future<void> stopSession();

  Future<bool> isRecording();

  Future<RecordingSession?> activeSession();
}
