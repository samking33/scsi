import 'entity.dart';

/// Base class for all evidence types
/// All evidence is immutable once created
abstract class Evidence extends Entity {
  final String id; // UUID
  final String caseId;
  final EvidenceType type;
  final DateTime timestamp; // Absolute UTC timestamp
  final int videoOffsetMs; // Milliseconds from case start
  final double latitude;
  final double longitude;
  final String fileHash; // SHA-256 hash of the evidence file
  final String filePath; // Encrypted storage path
  final String? notes;
  
  const Evidence({
    required this.id,
    required this.caseId,
    required this.type,
    required this.timestamp,
    required this.videoOffsetMs,
    required this.latitude,
    required this.longitude,
    required this.fileHash,
    required this.filePath,
    this.notes,
  });
}

/// Photo evidence captured during investigation
class PhotoEvidence extends Evidence {
  final int width;
  final int height;
  final List<Detection> detections; // YOLO detections
  
  const PhotoEvidence({
    required super.id,
    required super.caseId,
    required super.timestamp,
    required super.videoOffsetMs,
    required super.latitude,
    required super.longitude,
    required super.fileHash,
    required super.filePath,
    super.notes,
    required this.width,
    required this.height,
    required this.detections,
  }) : super(type: EvidenceType.photo);
}

/// Video segment from background recording
class VideoEvidence extends Evidence {
  final int durationMs;
  final int segmentNumber;
  final bool isRecoveredSegment; // True if recovered after crash
  
  const VideoEvidence({
    required super.id,
    required super.caseId,
    required super.timestamp,
    required super.videoOffsetMs,
    required super.latitude,
    required super.longitude,
    required super.fileHash,
    required super.filePath,
    super.notes,
    required this.durationMs,
    required this.segmentNumber,
    this.isRecoveredSegment = false,
  }) : super(type: EvidenceType.video);
}

/// Audio note recorded during investigation
class AudioEvidence extends Evidence {
  final int durationMs;
  final String? transcription; // Optional speech-to-text
  
  const AudioEvidence({
    required super.id,
    required super.caseId,
    required super.timestamp,
    required super.videoOffsetMs,
    required super.latitude,
    required super.longitude,
    required super.fileHash,
    required super.filePath,
    super.notes,
    required this.durationMs,
    this.transcription,
  }) : super(type: EvidenceType.audio);
}

/// Text note created during investigation
class TextEvidence extends Evidence {
  final String content;
  
  const TextEvidence({
    required super.id,
    required super.caseId,
    required super.timestamp,
    required super.videoOffsetMs,
    required super.latitude,
    required super.longitude,
    required super.fileHash,
    required super.filePath,
    super.notes,
    required this.content,
  }) : super(type: EvidenceType.text);
}

enum EvidenceType {
  photo,
  video,
  audio,
  text,
}

/// YOLO object detection result
class Detection {
  final String className;
  final double confidence;
  final BoundingBox boundingBox;
  
  const Detection({
    required this.className,
    required this.confidence,
    required this.boundingBox,
  });
}

/// Bounding box coordinates (normalized 0-1)
class BoundingBox {
  final double x; // Center X
  final double y; // Center Y
  final double width;
  final double height;
  
  const BoundingBox({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });
  
  /// Convert to pixel coordinates
  Map<String, int> toPixels(int imageWidth, int imageHeight) {
    final centerX = (x * imageWidth).round();
    final centerY = (y * imageHeight).round();
    final w = (width * imageWidth).round();
    final h = (height * imageHeight).round();
    
    return {
      'left': centerX - (w ~/ 2),
      'top': centerY - (h ~/ 2),
      'right': centerX + (w ~/ 2),
      'bottom': centerY + (h ~/ 2),
    };
  }
}
