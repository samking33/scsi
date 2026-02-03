import 'package:flutter/services.dart';

class RecordingStartRequest {
  const RecordingStartRequest({
    required this.caseId,
    required this.sessionId,
    required this.officerId,
    required this.width,
    required this.height,
    required this.fps,
    required this.bitrate,
    required this.maxSegmentSizeBytes,
    required this.audioEnabled,
  });

  final String caseId;
  final String sessionId;
  final String officerId;
  final int width;
  final int height;
  final int fps;
  final int bitrate;
  final int maxSegmentSizeBytes;
  final bool audioEnabled;

  Map<String, Object?> toMap() => {
        'caseId': caseId,
        'sessionId': sessionId,
        'officerId': officerId,
        'width': width,
        'height': height,
        'fps': fps,
        'bitrate': bitrate,
        'maxSegmentSizeBytes': maxSegmentSizeBytes,
        'audioEnabled': audioEnabled,
      };
}

class RecordingStartResult {
  const RecordingStartResult({required this.sessionDir});

  final String sessionDir;
}

class RecordingServiceChannel {
  static const MethodChannel _channel = MethodChannel('com.scsi.app/recording');

  Future<RecordingStartResult> start(RecordingStartRequest request) async {
    final response = await _channel.invokeMethod<Map<Object?, Object?>>(
      'startRecording',
      request.toMap(),
    );
    final sessionDir = response?['sessionDir'] as String? ?? '';
    return RecordingStartResult(sessionDir: sessionDir);
  }

  Future<void> stop() async {
    await _channel.invokeMethod('stopRecording');
  }

  Future<bool> isRecording() async {
    final result = await _channel.invokeMethod<bool>('isRecording');
    return result ?? false;
  }
}
