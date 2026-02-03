import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:scsi/core/settings/settings_repository.dart';
import 'package:scsi/features/evidence/data/recording_manifest.dart';

class VideoTimelinePage extends StatefulWidget {
  const VideoTimelinePage({
    super.key,
    required this.sessionId,
    required this.offset,
    required this.settingsRepository,
  });

  final String sessionId;
  final Duration offset;
  final SettingsRepository settingsRepository;

  @override
  State<VideoTimelinePage> createState() => _VideoTimelinePageState();
}

class _VideoTimelinePageState extends State<VideoTimelinePage> {
  VideoPlayerController? _controller;
  RecordingManifest? _manifest;
  RecordingSegment? _currentSegment;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final sessionDir = await widget.settingsRepository.getSessionDir(widget.sessionId);
    if (sessionDir == null) {
      setState(() {
        _error = 'Session directory not found.';
        _loading = false;
      });
      return;
    }

    final manifest = await RecordingManifest.loadFromSessionDir(sessionDir);
    if (manifest == null || manifest.segments.isEmpty) {
      setState(() {
        _error = 'No segments found for this session.';
        _loading = false;
      });
      return;
    }

    final offsetMs = widget.offset.inMilliseconds;
    final segment = manifest.segments.firstWhere(
      (s) => offsetMs >= s.startOffsetMs && offsetMs <= s.endOffsetMs,
      orElse: () => manifest.segments.last,
    );

    await _setSegment(segment, seekToOffset: widget.offset);

    setState(() {
      _manifest = manifest;
      _currentSegment = segment;
      _loading = false;
    });
  }

  Future<void> _setSegment(RecordingSegment segment, {Duration? seekToOffset}) async {
    await _controller?.dispose();
    final controller = VideoPlayerController.file(File(segment.filePath));
    await controller.initialize();

    if (seekToOffset != null) {
      final localMs = seekToOffset.inMilliseconds - segment.startOffsetMs;
      final safeMs = localMs.clamp(0, controller.value.duration.inMilliseconds);
      await controller.seekTo(Duration(milliseconds: safeMs));
    }

    setState(() {
      _controller = controller;
      _currentSegment = segment;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Video Timeline')),
        body: Center(child: Text(_error!)),
      );
    }

    final controller = _controller!;
    final manifest = _manifest!;

    return Scaffold(
      appBar: AppBar(title: const Text('Video Timeline')),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                  setState(() {});
                },
                icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${controller.value.position.inSeconds}s / '
                '${controller.value.duration.inSeconds}s',
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: manifest.segments.length,
              itemBuilder: (context, index) {
                final segment = manifest.segments[index];
                final selected = segment == _currentSegment;
                return ListTile(
                  title: Text(
                    'Segment ${index + 1} '
                    '(${segment.duration.inSeconds}s)',
                  ),
                  subtitle: Text(
                    '${segment.startOffsetMs ~/ 1000}s - ${segment.endOffsetMs ~/ 1000}s',
                  ),
                  selected: selected,
                  onTap: () => _setSegment(segment),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
