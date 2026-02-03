import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/core/platform/recording_service_channel.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/domain/repositories/recording_repository.dart';
import 'package:scsi/features/evidence/domain/value_objects/recording_config.dart';
import 'package:scsi/core/settings/settings_repository.dart';

class RecordingRepositoryImpl implements RecordingRepository {
  RecordingRepositoryImpl({RecordingServiceChannel? channel, SettingsRepository? settings})
      : _channel = channel ?? RecordingServiceChannel(),
        _settings = settings ?? SettingsRepository();

  final RecordingServiceChannel _channel;
  final SettingsRepository _settings;
  RecordingSession? _activeSession;

  @override
  Future<RecordingSession> startSession({
    required CaseId caseId,
    required OfficerId officerId,
    required RecordingConfig config,
  }) async {
    final sessionId = IdFactory.newRecordingSessionId();
    final result = await _channel.start(
      RecordingStartRequest(
        caseId: caseId.value,
        sessionId: sessionId.value,
        officerId: officerId.value,
        width: config.width,
        height: config.height,
        fps: config.fps,
        bitrate: config.bitrate,
        maxSegmentSizeBytes: config.maxSegmentSizeBytes,
        audioEnabled: config.audioEnabled,
      ),
    );

    await _settings.setSessionDir(sessionId.value, result.sessionDir);
    final session = RecordingSession(
      id: sessionId,
      caseId: caseId,
      startedAt: Timestamp.nowUtc(),
      startedBy: officerId,
      segments: const [],
    );
    _activeSession = session;
    return session;
  }

  @override
  Future<void> stopSession() async {
    await _channel.stop();
    _activeSession = null;
  }

  @override
  Future<bool> isRecording() => _channel.isRecording();

  @override
  Future<RecordingSession?> activeSession() async => _activeSession;
}
