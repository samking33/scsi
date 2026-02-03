import 'dart:convert';
import 'dart:io';

class RecordingSegment {
  RecordingSegment({
    required this.filePath,
    required this.startOffsetMs,
    required this.endOffsetMs,
    required this.startUtc,
    required this.endUtc,
  });

  final String filePath;
  final int startOffsetMs;
  final int endOffsetMs;
  final DateTime startUtc;
  final DateTime endUtc;

  Duration get duration => Duration(milliseconds: endOffsetMs - startOffsetMs);
}

class RecordingManifest {
  RecordingManifest({required this.segments});

  final List<RecordingSegment> segments;

  static Future<RecordingManifest?> loadFromSessionDir(String sessionDir) async {
    final file = File('$sessionDir/session.json');
    if (!await file.exists()) return null;
    final raw = await file.readAsString();
    final data = jsonDecode(raw) as Map<String, dynamic>;
    final segmentList = (data['segments'] as List<dynamic>? ?? [])
        .map((item) => _parseSegment(item as Map<String, dynamic>))
        .whereType<RecordingSegment>()
        .toList();
    return RecordingManifest(segments: segmentList);
  }

  static RecordingSegment? _parseSegment(Map<String, dynamic> json) {
    try {
      return RecordingSegment(
        filePath: json['filePath'] as String,
        startOffsetMs: (json['startOffsetMs'] as num).toInt(),
        endOffsetMs: (json['endOffsetMs'] as num).toInt(),
        startUtc: DateTime.parse(json['startUtc'] as String).toUtc(),
        endUtc: DateTime.parse(json['endUtc'] as String).toUtc(),
      );
    } catch (_) {
      return null;
    }
  }
}
