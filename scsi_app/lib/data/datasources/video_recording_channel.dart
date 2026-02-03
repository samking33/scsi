import 'package:flutter/services.dart';
import '../../core/error/exceptions.dart';

/// Platform channel for communicating with native Android video recording service
class VideoRecordingChannel {
  static const _methodChannel = MethodChannel('com.scsi.scsi_app/video_recording');
  static const _eventChannel = EventChannel('com.scsi.scsi_app/recording_events');
  
  /// Start background video recording
  /// Returns true if started successfully
  static Future<bool> startBackgroundRecording({
    required String caseId,
    required String outputDir,
  }) async {
    try {
      final result = await _methodChannel.invokeMethod<bool>(
        'startBackgroundRecording',
        {
          'caseId': caseId,
          'outputDir': outputDir,
        },
      );
      return result ?? false;
    } on PlatformException catch (e) {
      throw RecordingException(
        'Failed to start background recording: ${e.message}',
        code: e.code,
        originalError: e,
      );
    }
  }
  
  /// Stop background video recording
  static Future<bool> stopBackgroundRecording() async {
    try {
      final result = await _methodChannel.invokeMethod<bool>(
        'stopBackgroundRecording',
      );
      return result ?? false;
    } on PlatformException catch (e) {
      throw RecordingException(
        'Failed to stop background recording: ${e.message}',
        code: e.code,
        originalError: e,
      );
    }
  }
  
  /// Get current recording status
  static Future<RecordingStatus> getRecordingStatus() async {
    try {
      final result = await _methodChannel.invokeMethod<Map<dynamic, dynamic>>(
        'getRecordingStatus',
      );
      
      if (result == null) {
        return const RecordingStatus(
          isRecording: false,
          caseId: '',
          segmentNumber: 0,
          startTime: 0,
        );
      }
      
      return RecordingStatus(
        isRecording: result['isRecording'] as bool? ?? false,
        caseId: result['caseId'] as String? ?? '',
        segmentNumber: result['segmentNumber'] as int? ?? 0,
        startTime: result['startTime'] as int? ?? 0,
      );
    } on PlatformException catch (e) {
      throw RecordingException(
        'Failed to get recording status: ${e.message}',
        code: e.code,
        originalError: e,
      );
    }
  }
  
  /// Stream of recording events
  static Stream<Map<dynamic, dynamic>> get recordingEvents {
    return _eventChannel.receiveBroadcastStream().cast<Map<dynamic, dynamic>>();
  }
  
  /// Take a photo during recording
  /// Returns the absolute path of the captured photo
  static Future<String?> takePhoto() async {
    try {
      final result = await _methodChannel.invokeMethod<String>(
        'takePhoto',
      );
      return result;
    } on PlatformException catch (e) {
      throw RecordingException(
        'Failed to take photo: ${e.message}',
        code: e.code,
        originalError: e,
      );
    }
  }
}

/// Recording status model
class RecordingStatus {
  final bool isRecording;
  final String caseId;
  final int segmentNumber;
  final int startTime; // Milliseconds since epoch
  
  const RecordingStatus({
    required this.isRecording,
    required this.caseId,
    required this.segmentNumber,
    required this.startTime,
  });
  
  Duration get duration {
    if (!isRecording || startTime == 0) {
      return Duration.zero;
    }
    return Duration(milliseconds: DateTime.now().millisecondsSinceEpoch - startTime);
  }
}
