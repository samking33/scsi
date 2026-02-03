import 'dart:convert';
import '../../domain/entities/evidence.dart';

class EvidenceMapper {
  static Map<String, dynamic> toMap(Evidence evidence) {
    final map = {
      'id': evidence.id,
      'case_id': evidence.caseId,
      'type': evidence.type.name,
      'timestamp': evidence.timestamp.millisecondsSinceEpoch,
      'video_offset_ms': evidence.videoOffsetMs,
      'latitude': evidence.latitude,
      'longitude': evidence.longitude,
      'file_hash': evidence.fileHash,
      'file_path': evidence.filePath,
      'notes': evidence.notes,
    };
    
    // Pack type-specific fields into metadata JSON
    final metadata = <String, dynamic>{};
    
    if (evidence is PhotoEvidence) {
      metadata['width'] = evidence.width;
      metadata['height'] = evidence.height;
    } else if (evidence is VideoEvidence) {
      metadata['durationMs'] = evidence.durationMs;
      metadata['segmentNumber'] = evidence.segmentNumber;
      metadata['isRecovered'] = evidence.isRecoveredSegment;
    } else if (evidence is AudioEvidence) {
      metadata['durationMs'] = evidence.durationMs;
      metadata['transcription'] = evidence.transcription;
    } else if (evidence is TextEvidence) {
      metadata['content'] = evidence.content;
    }
    
    map['metadata'] = jsonEncode(metadata);
    return map;
  }
  
  static Evidence fromMap(Map<String, dynamic> map, List<Detection> detections) {
    final typeStr = map['type'] as String;
    final type = EvidenceType.values.firstWhere((e) => e.name == typeStr);
    final metadata = jsonDecode(map['metadata'] as String) as Map<String, dynamic>;
    
    final id = map['id'] as String;
    final caseId = map['case_id'] as String;
    final timestamp = DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int, isUtc: true);
    final offset = map['video_offset_ms'] as int;
    final lat = map['latitude'] as double;
    final long = map['longitude'] as double;
    final hash = map['file_hash'] as String;
    final path = map['file_path'] as String;
    final notes = map['notes'] as String?;
    
    switch (type) {
      case EvidenceType.photo:
        return PhotoEvidence(
          id: id,
          caseId: caseId,
          timestamp: timestamp,
          videoOffsetMs: offset,
          latitude: lat,
          longitude: long,
          fileHash: hash,
          filePath: path,
          notes: notes,
          width: metadata['width'] as int? ?? 0,
          height: metadata['height'] as int? ?? 0,
          detections: detections,
        );
        
      case EvidenceType.video:
        return VideoEvidence(
          id: id,
          caseId: caseId,
          timestamp: timestamp,
          videoOffsetMs: offset,
          latitude: lat,
          longitude: long,
          fileHash: hash,
          filePath: path,
          notes: notes,
          durationMs: metadata['durationMs'] as int? ?? 0,
          segmentNumber: metadata['segmentNumber'] as int? ?? 0,
          isRecoveredSegment: metadata['isRecovered'] as bool? ?? false,
        );
        
      case EvidenceType.audio:
        return AudioEvidence(
          id: id,
          caseId: caseId,
          timestamp: timestamp,
          videoOffsetMs: offset,
          latitude: lat,
          longitude: long,
          fileHash: hash,
          filePath: path,
          notes: notes,
          durationMs: metadata['durationMs'] as int? ?? 0,
          transcription: metadata['transcription'] as String?,
        );
        
      case EvidenceType.text:
        return TextEvidence(
          id: id,
          caseId: caseId,
          timestamp: timestamp,
          videoOffsetMs: offset,
          latitude: lat,
          longitude: long,
          fileHash: hash,
          filePath: path,
          notes: notes,
          content: metadata['content'] as String? ?? '',
        );
    }
  }
}
