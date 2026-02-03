import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'dart:io';
import '../../domain/entities/case.dart';
import '../../domain/entities/evidence.dart';
import '../../domain/entities/chain_of_custody_log.dart';
import '../../data/datasources/video_recording_channel.dart';
import '../../data/datasources/location_tracker.dart';
import '../../data/datasources/yolo_detector.dart';
import '../../core/utils/crypto_utils.dart';
import '../providers/repository_providers.dart';

/// Active investigation screen
/// Main hub for evidence collection during an active case
class ActiveInvestigationScreen extends ConsumerStatefulWidget {
  final Case case_;
  
  const ActiveInvestigationScreen({
    super.key,
    required this.case_,
  });

  @override
  ConsumerState<ActiveInvestigationScreen> createState() => _ActiveInvestigationScreenState();
}

class _ActiveInvestigationScreenState extends ConsumerState<ActiveInvestigationScreen> {
  bool _isRecording = false;
  Duration _recordingDuration = Duration.zero;
  Stream<Position>? _locationStream;
  final LocationTracker _locationTracker = LocationTracker();
  final YoloDetector _yoloDetector = YoloDetector();
  late final AudioRecorder _audioRecorder;
  bool _isRecordingAudio = false;
  DateTime? _audioStartTime;
  
  @override
  void initState() {
    super.initState();
    _audioRecorder = AudioRecorder();
    _loadModels();
    _startBackgroundRecording();

    _startDurationTimer();
    _initLocationTracking();
    
    // Prevent screenshots
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }
  
  @override
  void dispose() {
    _audioRecorder.dispose();
    // Re-enable screenshots
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }
  
  void _startDurationTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted && _isRecording) {
        setState(() {
          _recordingDuration = DateTime.now().toUtc().difference(widget.case_.startTime);
        });
        return true;
      }
      return false;
    });
  }
  
  Future<void> _initLocationTracking() async {
    try {
      await _locationTracker.getCurrentLocation();
      if (mounted) {
        setState(() {
          _locationStream = _locationTracker.startTracking();
        });
      }
    } catch (e) {
      debugPrint('Location error: $e');
    }
  }
  
  Future<void> _loadModels() async {
    try {
      await _yoloDetector.initialize();
    } catch (e) {
      debugPrint('YOLO loading error: $e');
    }
  }

  Future<void> _capturePhoto() async {
    try {
      // 1. Capture Photo
      final path = await VideoRecordingChannel.takePhoto();
      if (path == null) return;
      
      // 2. Get Metadata
      final position = await _locationTracker.getCurrentLocation();
      final now = DateTime.now().toUtc();
      final offsetMs = now.difference(widget.case_.startTime).inMilliseconds;
      
      // 3. Process Image (Hash & Detect)
      final hash = await CryptoUtils.hashFile(path);
      List<Detection> detections = [];
      try {
        final bytes = await File(path).readAsBytes();
        detections = await _yoloDetector.detectObjects(bytes);
      } catch (e) {
        debugPrint('Detection/Read error: $e');
      }
      
      // 4. Create Evidence
      final evidence = PhotoEvidence(
        id: const Uuid().v4(),
        caseId: widget.case_.id,
        timestamp: now,
        videoOffsetMs: offsetMs,
        latitude: position.latitude,
        longitude: position.longitude,
        fileHash: hash,
        filePath: path,
        width: 1920, // Assumed from service
        height: 1080,
        detections: detections,
      );
      
      // 5. Save Entities (Refactored)
      await _secureAndSaveEvidence(evidence);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Evidence Captured: ${detections.length} objects detected'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Capture Failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _recordAudio() async {
    try {
      if (_isRecordingAudio) {
        // Stop recording
        final path = await _audioRecorder.stop();
        setState(() {
          _isRecordingAudio = false;
        });
        
        if (path != null && _audioStartTime != null) {
           final now = DateTime.now().toUtc();
           final durationMs = now.difference(_audioStartTime!).inMilliseconds;
           
           final position = await _locationTracker.getCurrentLocation();
           final caseOffsetMs = _audioStartTime!.difference(widget.case_.startTime).inMilliseconds;
           final hash = await CryptoUtils.hashFile(path);
           
           final evidence = AudioEvidence(
             id: const Uuid().v4(),
             caseId: widget.case_.id,
             timestamp: _audioStartTime!,
             videoOffsetMs: caseOffsetMs,
             latitude: position.latitude,
             longitude: position.longitude,
             fileHash: hash,
             filePath: path,
             durationMs: durationMs,
           );
           
           await _secureAndSaveEvidence(evidence);
           
           if (mounted) {
             ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(content: Text('Audio Note Saved'), backgroundColor: Colors.green),
             );
           }
        }
      } else {
        // Start recording
        if (await _audioRecorder.hasPermission()) {
          final directory = await getApplicationDocumentsDirectory();
          final path = '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
          
          await _audioRecorder.start(const RecordConfig(), path: path);
          
          setState(() {
            _isRecordingAudio = true;
            _audioStartTime = DateTime.now().toUtc();
          });
        }
      }
    } catch (e) {
      debugPrint('Audio error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Audio Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _addTextNote() async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Text Note'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter observations...'),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                 Navigator.pop(context);
                 final content = controller.text;
                 final now = DateTime.now().toUtc();
                 final position = await _locationTracker.getCurrentLocation();
                 final offsetMs = now.difference(widget.case_.startTime).inMilliseconds;
                 
                 // Hash content for integrity
                 final hash = CryptoUtils.hashString(content);
                 // Text doesn't have a file path, usually. 
                 // But Evidence entity requires filePath.
                 // We should save text to a file for consistency? Or empty string?
                 // Architecture typically wants files. I'll save to a .txt file.
                 
                 final directory = await getApplicationDocumentsDirectory();
                 final path = '${directory.path}/note_${now.millisecondsSinceEpoch}.txt';
                 final file = File(path);
                 await file.writeAsString(content);
                 
                 final evidence = TextEvidence(
                   id: const Uuid().v4(),
                   caseId: widget.case_.id,
                   timestamp: now,
                   videoOffsetMs: offsetMs,
                   latitude: position.latitude,
                   longitude: position.longitude,
                   fileHash: hash,
                   filePath: path,
                   content: content,
                 );
                 
                 await _secureAndSaveEvidence(evidence);
                 
                 if (mounted) {
                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Note Saved'), backgroundColor: Colors.green),
                   );
                 }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _secureAndSaveEvidence(Evidence evidence) async {
      await ref.read(evidenceRepositoryProvider).saveEvidence(evidence);
      
      final lastHash = await ref.read(databaseManagerProvider).getLastLogHash(widget.case_.id) 
          ?? widget.case_.id;
          
      final log = ChainOfCustodyLog(
        id: const Uuid().v4(),
        caseId: widget.case_.id,
        evidenceId: evidence.id,
        action: ChainOfCustodyAction.created,
        officerId: widget.case_.officerId,
        officerName: widget.case_.officerName,
        timestamp: evidence.timestamp,
        previousLogHash: lastHash,
        currentLogHash: '',
      );
      
      final realHash = CryptoUtils.generateChainHash(
        previousHash: log.previousLogHash,
        data: log.getHashData(),
      );
      
      final finalLog = ChainOfCustodyLog(
        id: log.id,
        caseId: log.caseId,
        evidenceId: log.evidenceId,
        action: log.action,
        officerId: log.officerId,
        officerName: log.officerName,
        timestamp: log.timestamp,
        previousLogHash: log.previousLogHash,
        currentLogHash: realHash,
      );
      
      await ref.read(chainOfCustodyRepositoryProvider).logEvent(finalLog);
  }
  
  Future<void> _startBackgroundRecording() async {
    try {
      // Get output directory
      final directory = await getApplicationDocumentsDirectory();
      final caseDir = Directory('${directory.path}/cases/${widget.case_.id}');
      
      if (!await caseDir.exists()) {
        await caseDir.create(recursive: true);
      }
      
      // Start background recording
      final success = await VideoRecordingChannel.startBackgroundRecording(
        caseId: widget.case_.id,
        outputDir: caseDir.path,
      );
      
      setState(() {
        _isRecording = success;
      });
      
      if (!success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to start background recording'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error starting recording: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  Future<void> _stopInvestigation() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End Investigation?'),
        content: const Text(
          'Are you sure you want to end this investigation?\n\n'
          'Background recording will stop and the case will be closed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('End Investigation'),
          ),
        ],
      ),
    );
    
    if (confirm == true) {
      try {
        await VideoRecordingChannel.stopBackgroundRecording();
        
        if (mounted) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error stopping recording: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
  
  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Use "End Investigation" button to close this case'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Active Investigation'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Case Information'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildInfoRow('Case ID', widget.case_.id),
                          _buildInfoRow('Officer', widget.case_.officerName),
                          _buildInfoRow('Badge', widget.case_.officerBadgeNumber),
                          _buildInfoRow('Type', widget.case_.caseType),
                          _buildInfoRow('Description', widget.case_.description),
                          _buildInfoRow('Started', widget.case_.startTime.toLocal().toString()),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Recording status card
                Card(
                  color: _isRecording ? Colors.red.shade50 : Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isRecording)
                              Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            const SizedBox(width: 12),
                            Text(
                              _isRecording ? 'RECORDING' : 'NOT RECORDING',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: _isRecording ? Colors.red : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _formatDuration(_recordingDuration),
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Location Display
                if (_locationStream != null)
                  StreamBuilder<Position>(
                    stream: _locationStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final pos = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_on, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                '${pos.latitude.toStringAsFixed(6)}, ${pos.longitude.toStringAsFixed(6)}',
                                style: const TextStyle(
                                  fontFamily: 'Monospace',
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '±${pos.accuracy.toStringAsFixed(1)}m',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                
                const SizedBox(height: 16),
                
                // Evidence capture section
                Text(
                  'Capture Evidence',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Photo button
                _buildEvidenceButton(
                  icon: Icons.camera_alt,
                  label: 'Capture Photo',
                  color: Colors.blue,
                  onPressed: _capturePhoto,
                ),
                
                const SizedBox(height: 12),
                
                // Audio note button
                _buildEvidenceButton(
                  icon: _isRecordingAudio ? Icons.stop : Icons.mic,
                  label: _isRecordingAudio ? 'Stop Recording' : 'Record Audio Note',
                  color: _isRecordingAudio ? Colors.redAccent : Colors.orange,
                  onPressed: _recordAudio,
                ),
                
                const SizedBox(height: 12),
                
                // Text note button
                _buildEvidenceButton(
                  icon: Icons.note_add,
                  label: 'Add Text Note',
                  color: Colors.green,
                  onPressed: _addTextNote,
                ),
                
                const SizedBox(height: 24),
                
                // View options
                Text(
                  'View',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Timeline - Coming soon'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.timeline),
                        label: const Text('Timeline'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Map - Coming soon'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.map),
                        label: const Text('Map'),
                      ),
                    ),
                  ],
                ),
                
                const Spacer(),
                
                // End investigation button
                ElevatedButton.icon(
                  onPressed: _stopInvestigation,
                  icon: const Icon(Icons.stop),
                  label: const Text(
                    'End Investigation',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildEvidenceButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 28),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: color,
        foregroundColor: Colors.white,
        alignment: Alignment.centerLeft,
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
