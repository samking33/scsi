import 'package:equatable/equatable.dart';

class RecordingConfig extends Equatable {
  const RecordingConfig({
    required this.width,
    required this.height,
    required this.fps,
    required this.bitrate,
    required this.maxSegmentSizeBytes,
    required this.audioEnabled,
  });

  final int width;
  final int height;
  final int fps;
  final int bitrate;
  final int maxSegmentSizeBytes;
  final bool audioEnabled;

  factory RecordingConfig.standardEvidence() => const RecordingConfig(
        width: 1920,
        height: 1080,
        fps: 30,
        bitrate: 10000000,
        maxSegmentSizeBytes: 1500000000,
        audioEnabled: true,
      );

  @override
  List<Object?> get props => [
        width,
        height,
        fps,
        bitrate,
        maxSegmentSizeBytes,
        audioEnabled,
      ];
}
