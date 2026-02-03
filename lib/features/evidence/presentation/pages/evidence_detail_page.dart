import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/presentation/pages/video_timeline_page.dart';
import 'package:scsi/core/settings/settings_repository.dart';

class EvidenceDetailPage extends StatefulWidget {
  const EvidenceDetailPage({
    super.key,
    required this.evidence,
    required this.settingsRepository,
  });

  final EvidenceItem evidence;
  final SettingsRepository settingsRepository;

  @override
  State<EvidenceDetailPage> createState() => _EvidenceDetailPageState();
}

class _EvidenceDetailPageState extends State<EvidenceDetailPage> {
  VideoPlayerController? _videoController;
  AudioPlayer? _audioPlayer;
  bool _isAudioPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.evidence is VideoSegmentEvidence) {
      final segment = widget.evidence as VideoSegmentEvidence;
      _videoController = VideoPlayerController.file(File(segment.segment.file.path))
        ..initialize().then((_) {
          if (mounted) setState(() {});
        });
    }
    if (widget.evidence is AudioEvidence) {
      _audioPlayer = AudioPlayer();
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final evidence = widget.evidence;

    return Scaffold(
      appBar: AppBar(
        title: Text(evidence.type.name.toUpperCase()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMediaPreview(evidence),
          const SizedBox(height: 16),
          if (evidence.videoOffset > Duration.zero)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => VideoTimelinePage(
                      sessionId: evidence.sessionId.value,
                      offset: evidence.videoOffset,
                      settingsRepository: widget.settingsRepository,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.play_circle_outline),
              label: const Text('Open Video Context'),
            ),
          if (evidence.videoOffset > Duration.zero) const SizedBox(height: 16),
          _buildMetadata(evidence),
        ],
      ),
    );
  }

  Widget _buildMediaPreview(EvidenceItem evidence) {
    if (evidence is PhotoEvidence) {
      return AspectRatio(
        aspectRatio: evidence.width > 0 && evidence.height > 0
            ? evidence.width / evidence.height
            : 4 / 3,
        child: InteractiveViewer(
          child: Image.file(File(evidence.file.path), fit: BoxFit.contain),
        ),
      );
    }

    if (evidence is AudioEvidence) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Audio Note', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  if (_audioPlayer == null) return;
                  if (_isAudioPlaying) {
                    await _audioPlayer!.pause();
                  } else {
                    await _audioPlayer!.play(DeviceFileSource(evidence.file.path));
                  }
                  if (mounted) {
                    setState(() {
                      _isAudioPlaying = !_isAudioPlaying;
                    });
                  }
                },
                icon: Icon(_isAudioPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(_isAudioPlaying ? 'Pause' : 'Play'),
              ),
              const SizedBox(width: 12),
              Text('Duration: ${evidence.duration.inSeconds}s'),
            ],
          ),
        ],
      );
    }

    if (evidence is NoteEvidence) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(evidence.text, style: Theme.of(context).textTheme.bodyLarge),
      );
    }

    if (evidence is VideoSegmentEvidence) {
      final controller = _videoController;
      if (controller == null || !controller.value.isInitialized) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                  setState(() {});
                },
                icon: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(controller.value.isPlaying ? 'Pause' : 'Play'),
              ),
              const SizedBox(width: 12),
              Text('Duration: ${controller.value.duration.inSeconds}s'),
            ],
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildMetadata(EvidenceItem evidence) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Captured At: ${evidence.capturedAt.utc.toLocal()}'),
            const SizedBox(height: 6),
            Text('Video Offset: ${evidence.videoOffset.inSeconds}s'),
            const SizedBox(height: 6),
            Text(
              'Location: ${evidence.location.latitude.toStringAsFixed(5)}, '
              '${evidence.location.longitude.toStringAsFixed(5)}',
            ),
            if (evidence is PhotoEvidence) ...[
              const SizedBox(height: 6),
              Text('Resolution: ${evidence.width} x ${evidence.height}'),
              Text('File: ${evidence.file.path}'),
            ],
            if (evidence is AudioEvidence) ...[
              const SizedBox(height: 6),
              Text('File: ${evidence.file.path}'),
            ],
            if (evidence is NoteEvidence) ...[
              const SizedBox(height: 6),
              const Text('Note attached.'),
            ],
            if (evidence is VideoSegmentEvidence) ...[
              const SizedBox(height: 6),
              Text('Segment file: ${evidence.segment.file.path}'),
            ],
          ],
        ),
      ),
    );
  }
}
