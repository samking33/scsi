import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:share_plus/share_plus.dart';
import 'package:scsi/app/providers.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/enums/audit_action.dart';
import 'package:scsi/core/domain/enums/evidence_type.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:scsi/features/chain_of_custody/domain/entities/audit_event.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/presentation/recording_controller.dart';
import 'package:scsi/features/evidence/presentation/pages/evidence_detail_page.dart';
import 'package:scsi/features/evidence/presentation/evidence_export_service.dart';
import 'package:scsi/features/reporting/presentation/report_generator.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';
import 'package:scsi/features/timeline/domain/entities/timeline_entry.dart';

class CaseDetailPage extends ConsumerWidget {
  const CaseDetailPage({super.key, required this.caseFile});

  final CaseFile caseFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recording = ref.watch(recordingControllerProvider);
    final isRecording = recording.isRecording;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(caseFile.title),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Evidence'),
              Tab(text: 'Timeline'),
              Tab(text: 'Map'),
              Tab(text: 'Audit'),
              Tab(text: 'Reports'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      isRecording ? 'Recording Active' : 'Recording Stopped',
                      style: TextStyle(
                        color: isRecording ? Colors.red : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: isRecording
                        ? null
                        : () => ref
                            .read(recordingControllerProvider.notifier)
                            .startRecording(
                              caseId: caseFile.id,
                              officerId: caseFile.leadOfficer.id,
                            ),
                    icon: const Icon(Icons.fiber_manual_record),
                    label: const Text('Start'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: isRecording
                        ? () => ref
                            .read(recordingControllerProvider.notifier)
                            .stopRecording(officerId: caseFile.leadOfficer.id)
                        : null,
                    icon: const Icon(Icons.stop),
                    label: const Text('Stop'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: isRecording
                        ? () => _capturePhoto(context, ref)
                        : null,
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('Photo'),
                  ),
                  OutlinedButton.icon(
                    onPressed: isRecording
                        ? () => _captureNote(context, ref)
                        : null,
                    icon: const Icon(Icons.note_add),
                    label: const Text('Note'),
                  ),
                  OutlinedButton.icon(
                    onPressed: isRecording
                        ? () => _captureAudio(context, ref)
                        : null,
                    icon: const Icon(Icons.mic),
                    label: const Text('Audio'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _generateReport(context, ref),
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Generate Report'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _exportBundle(context, ref),
                    icon: const Icon(Icons.archive),
                    label: const Text('Export Bundle'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                children: [
                  EvidenceTab(caseFile: caseFile),
                  TimelineTab(caseFile: caseFile),
                  MapTab(caseFile: caseFile),
                  AuditTab(caseFile: caseFile),
                  ReportsTab(caseFile: caseFile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _capturePhoto(BuildContext context, WidgetRef ref) async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Camera permission required.')),
        );
      }
      return;
    }

    final picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.camera, imageQuality: 90);
    if (photo == null) return;

    final recording = ref.read(recordingControllerProvider);
    final session = recording.session;
    if (session == null) return;

    final location = await ref.read(locationServiceProvider).currentLocation();
    if (location == null) return;

    final fileRef = await ref
        .read(evidenceCaptureServiceProvider)
        .savePhoto(caseId: caseFile.id, photo: photo);
    final imageInfo = await _readImageInfo(fileRef.path);

    final evidence = PhotoEvidence(
      id: IdFactory.newEvidenceId(),
      caseId: caseFile.id,
      sessionId: session.id,
      capturedBy: caseFile.leadOfficer.id,
      capturedAt: Timestamp.nowUtc(),
      videoOffset: ref.read(recordingControllerProvider.notifier).videoOffset(),
      location: location,
      file: fileRef,
      width: imageInfo.$1,
      height: imageInfo.$2,
      mimeType: 'image/jpeg',
    );

    await ref.read(evidenceRepositoryProvider).addEvidence(evidence);
    await _appendAudit(
      ref,
      action: AuditAction.evidenceCaptured,
      details: {'type': EvidenceType.photo.name, 'path': fileRef.path},
    );
    await _addTimeline(ref, evidence: evidence, type: TimelineEntryType.photo);
    ref.invalidate(evidenceListProvider(caseFile.id));
    ref.invalidate(timelineListProvider(caseFile.id));

    try {
      await ref.read(detectionRepositoryProvider).analyzeImage(
            caseId: caseFile.id,
            sessionId: session.id,
            evidenceId: evidence.id,
            imageFile: File(fileRef.path),
            videoOffset: evidence.videoOffset,
          );
      await _appendAudit(
        ref,
        action: AuditAction.aiDetectionExecuted,
        details: {'evidenceId': evidence.id.value},
      );
    } catch (_) {
      // AI server might be offline; continue without blocking evidence capture.
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Photo captured.')),
      );
    }
  }

  Future<void> _captureNote(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Note'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration: const InputDecoration(hintText: 'Describe the evidence'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;

    final recording = ref.read(recordingControllerProvider);
    final session = recording.session;
    if (session == null) return;

    final location = await ref.read(locationServiceProvider).currentLocation();
    if (location == null) return;

    final evidence = NoteEvidence(
      id: IdFactory.newEvidenceId(),
      caseId: caseFile.id,
      sessionId: session.id,
      capturedBy: caseFile.leadOfficer.id,
      capturedAt: Timestamp.nowUtc(),
      videoOffset: ref.read(recordingControllerProvider.notifier).videoOffset(),
      location: location,
      text: result,
    );

    await ref.read(evidenceRepositoryProvider).addEvidence(evidence);
    await _appendAudit(
      ref,
      action: AuditAction.evidenceCaptured,
      details: {'type': EvidenceType.note.name, 'text': result},
    );
    await _addTimeline(ref, evidence: evidence, type: TimelineEntryType.note);
    ref.invalidate(evidenceListProvider(caseFile.id));
    ref.invalidate(timelineListProvider(caseFile.id));
  }

  Future<void> _captureAudio(BuildContext context, WidgetRef ref) async {
    final record = AudioRecorder();
    final micStatus = await Permission.microphone.request();
    if (!micStatus.isGranted) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Microphone permission required.')),
        );
      }
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('scsi_audio');
    final tempPath = '${tempDir.path}/note_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AudioRecorderDialog(record: record, outputPath: tempPath);
      },
    );

    final exists = await File(tempPath).exists();
    if (!exists) return;

    final recording = ref.read(recordingControllerProvider);
    final session = recording.session;
    if (session == null) return;

    final location = await ref.read(locationServiceProvider).currentLocation();
    if (location == null) return;

    final fileRef = await ref
        .read(evidenceCaptureServiceProvider)
        .saveAudio(caseId: caseFile.id, audioPath: tempPath);

    final evidence = AudioEvidence(
      id: IdFactory.newEvidenceId(),
      caseId: caseFile.id,
      sessionId: session.id,
      capturedBy: caseFile.leadOfficer.id,
      capturedAt: Timestamp.nowUtc(),
      videoOffset: ref.read(recordingControllerProvider.notifier).videoOffset(),
      location: location,
      file: fileRef,
      duration: const Duration(seconds: 0),
      mimeType: 'audio/m4a',
    );

    await ref.read(evidenceRepositoryProvider).addEvidence(evidence);
    await _appendAudit(
      ref,
      action: AuditAction.evidenceCaptured,
      details: {'type': EvidenceType.audio.name, 'path': fileRef.path},
    );
    await _addTimeline(ref, evidence: evidence, type: TimelineEntryType.audio);
    ref.invalidate(evidenceListProvider(caseFile.id));
    ref.invalidate(timelineListProvider(caseFile.id));
  }

  Future<void> _generateReport(BuildContext context, WidgetRef ref) async {
    final generator = ReportGenerator(
      evidenceRepository: ref.read(evidenceRepositoryProvider),
      detectionRepository: ref.read(detectionRepositoryProvider),
      auditRepository: ref.read(auditRepositoryProvider),
      fileHashService: ref.read(fileHashServiceProvider),
    );

    final report = await generator.generate(caseFile: caseFile);
    await ref.read(reportRepositoryProvider).addReport(report);
    ref.invalidate(reportListProvider(caseFile.id));

    await _appendAudit(
      ref,
      action: AuditAction.reportGenerated,
      details: {'path': report.pdfFile.path},
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Report generated.')),
      );
    }
  }

  Future<void> _exportBundle(BuildContext context, WidgetRef ref) async {
    final exportService = EvidenceExportService(
      caseRepository: ref.read(caseRepositoryProvider),
      evidenceRepository: ref.read(evidenceRepositoryProvider),
      detectionRepository: ref.read(detectionRepositoryProvider),
      timelineRepository: ref.read(timelineRepositoryProvider),
      auditRepository: ref.read(auditRepositoryProvider),
      reportRepository: ref.read(reportRepositoryProvider),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preparing export bundle...')),
    );

    try {
      final zipFile = await exportService.exportCaseBundle(caseFile.id.value);
      if (!context.mounted) return;
      await Share.shareXFiles(
        [XFile(zipFile.path)],
        text: 'Smart CSI export bundle',
      );
    } catch (err) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Export failed: $err')),
      );
    }
  }

  Future<void> _appendAudit(
    WidgetRef ref, {
    required AuditAction action,
    required Map<String, Object?> details,
  }) async {
    final auditRepo = ref.read(auditRepositoryProvider);
    final latest = await auditRepo.latestEvent(caseFile.id);
    final sequence = (latest?.sequence ?? 0) + 1;
    final previous = latest?.hash ?? const HashDigest('');

    final event = AuditEvent.create(
      id: IdFactory.newAuditEventId(),
      caseId: caseFile.id,
      sequence: sequence,
      action: action,
      occurredAt: Timestamp.nowUtc(),
      details: details,
      previousHash: previous,
      actorId: caseFile.leadOfficer.id,
    );

    await auditRepo.appendEvent(event);
    ref.invalidate(auditListProvider(caseFile.id));
  }

  Future<void> _addTimeline(
    WidgetRef ref, {
    required EvidenceItem evidence,
    required TimelineEntryType type,
  }) async {
    final timelineRepo = ref.read(timelineRepositoryProvider);
    final entry = TimelineEntry(
      id: IdFactory.newEvidenceId().value,
      caseId: caseFile.id,
      sessionId: evidence.sessionId,
      type: type,
      occurredAt: evidence.capturedAt,
      videoOffset: evidence.videoOffset,
      evidenceId: evidence.id,
    );
    await timelineRepo.addEntry(entry);
  }

  Future<(int, int)> _readImageInfo(String path) async {
    try {
      final bytes = await File(path).readAsBytes();
      final image = await decodeImageFromList(bytes);
      return (image.width, image.height);
    } catch (_) {
      return (0, 0);
    }
  }
}

final evidenceListProvider = FutureProvider.family<List<EvidenceItem>, CaseId>((ref, caseId) {
  return ref.read(evidenceRepositoryProvider).listEvidence(caseId);
});

final timelineListProvider = FutureProvider.family<List<TimelineEntry>, CaseId>((ref, caseId) {
  return ref.read(timelineRepositoryProvider).listEntries(caseId);
});

class EvidenceFilterState {
  EvidenceFilterState({
    this.type,
    this.start,
    this.end,
  });

  final EvidenceType? type;
  final DateTime? start;
  final DateTime? end;

  EvidenceFilterState copyWith({
    EvidenceType? type,
    DateTime? start,
    DateTime? end,
  }) {
    return EvidenceFilterState(
      type: type ?? this.type,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}

final evidenceFilterProvider = StateProvider<EvidenceFilterState>((ref) {
  return EvidenceFilterState();
});

final timelineFilterProvider = StateProvider<EvidenceFilterState>((ref) {
  return EvidenceFilterState();
});

final auditListProvider = FutureProvider.family((ref, CaseId caseId) {
  return ref.read(auditRepositoryProvider).listEvents(caseId);
});

final reportListProvider = FutureProvider.family((ref, CaseId caseId) {
  return ref.read(reportRepositoryProvider).listReports(caseId);
});

final recordingSessionsProvider =
    FutureProvider.family<List<RecordingSessionRecord>, CaseId>((ref, caseId) async {
  final db = ref.read(databaseProvider);
  return (db.select(db.recordingSessions)
        ..where((tbl) => tbl.caseId.equals(caseId.value))
        ..orderBy([(tbl) => drift.OrderingTerm.desc(tbl.startedAt)]))
      .get();
});

final pathPointsProvider =
    FutureProvider.family((ref, RecordingSessionId sessionId) {
  return ref.read(geospatialRepositoryProvider).listPathPoints(sessionId);
});

class EvidenceTab extends ConsumerWidget {
  const EvidenceTab({super.key, required this.caseFile});

  final CaseFile caseFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(evidenceFilterProvider);
    return ref.watch(evidenceListProvider(caseFile.id)).when(
      data: (items) {
        final filtered = items.where((item) {
          if (filter.type != null && item.type != filter.type) return false;
          final captured = item.capturedAt.utc;
          if (filter.start != null && captured.isBefore(filter.start!)) return false;
          if (filter.end != null && captured.isAfter(filter.end!)) return false;
          return true;
        }).toList();

        if (filtered.isEmpty) {
          return const Center(child: Text('No evidence captured yet.'));
        }
        return Column(
          children: [
            _EvidenceFilterBar(
              filter: filter,
              onChanged: (next) => ref.read(evidenceFilterProvider.notifier).state = next,
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: filtered.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = filtered[index];
            return ListTile(
              title: Text(item.type.name.toUpperCase()),
              subtitle: Text(item.capturedAt.utc.toLocal().toString()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EvidenceDetailPage(
                      evidence: item,
                      settingsRepository: ref.read(settingsRepositoryProvider),
                    ),
                  ),
                );
              },
            );
          },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class TimelineTab extends ConsumerWidget {
  const TimelineTab({super.key, required this.caseFile});

  final CaseFile caseFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(timelineFilterProvider);
    return ref.watch(timelineListProvider(caseFile.id)).when(
      data: (entries) {
        final filtered = entries.where((entry) {
          if (filter.type != null) {
            final wantedType = _mapEvidenceTypeToTimeline(filter.type!);
            if (wantedType != null && entry.type != wantedType) return false;
          }
          final occurred = entry.occurredAt.utc;
          if (filter.start != null && occurred.isBefore(filter.start!)) return false;
          if (filter.end != null && occurred.isAfter(filter.end!)) return false;
          return true;
        }).toList();

        if (filtered.isEmpty) {
          return const Center(child: Text('No timeline entries yet.'));
        }
        return Column(
          children: [
            _EvidenceFilterBar(
              filter: filter,
              onChanged: (next) => ref.read(timelineFilterProvider.notifier).state = next,
              includeTypeAll: true,
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: filtered.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final entry = filtered[index];
            return ListTile(
              title: Text(entry.type.name),
              subtitle: Text(entry.occurredAt.utc.toLocal().toString()),
              trailing: entry.evidenceId != null
                  ? const Icon(Icons.chevron_right)
                  : null,
              onTap: entry.evidenceId == null
                  ? null
                  : () async {
                      final evidence = await ref
                          .read(evidenceRepositoryProvider)
                          .getEvidence(entry.evidenceId!);
                      if (evidence == null || !context.mounted) return;
                      if (!context.mounted) return;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => EvidenceDetailPage(
                            evidence: evidence,
                            settingsRepository: ref.read(settingsRepositoryProvider),
                          ),
                        ),
                      );
                    },
            );
          },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

TimelineEntryType? _mapEvidenceTypeToTimeline(EvidenceType type) {
  switch (type) {
    case EvidenceType.photo:
      return TimelineEntryType.photo;
    case EvidenceType.audio:
      return TimelineEntryType.audio;
    case EvidenceType.note:
      return TimelineEntryType.note;
    case EvidenceType.videoSegment:
      return TimelineEntryType.videoSegment;
  }
}

class _EvidenceFilterBar extends StatelessWidget {
  const _EvidenceFilterBar({
    required this.filter,
    required this.onChanged,
    this.includeTypeAll = false,
  });

  final EvidenceFilterState filter;
  final ValueChanged<EvidenceFilterState> onChanged;
  final bool includeTypeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          DropdownButton<EvidenceType?>(
            value: filter.type,
            hint: const Text('Type'),
            items: [
              if (includeTypeAll)
                const DropdownMenuItem<EvidenceType?>(
                  value: null,
                  child: Text('All'),
                ),
              ...EvidenceType.values.map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(type.name),
                ),
              ),
            ],
            onChanged: (value) => onChanged(filter.copyWith(type: value)),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              final picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now().add(const Duration(days: 1)),
              );
              if (picked != null) {
                onChanged(
                  filter.copyWith(
                    start: picked.start.toUtc(),
                    end: picked.end.toUtc(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.date_range),
            label: const Text('Date Range'),
          ),
          if (filter.start != null || filter.end != null)
            Text(
              '${filter.start?.toLocal().toString().split(' ').first ?? ''} - '
              '${filter.end?.toLocal().toString().split(' ').first ?? ''}',
            ),
          TextButton(
            onPressed: () => onChanged(EvidenceFilterState()),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}

class MapTab extends ConsumerWidget {
  const MapTab({super.key, required this.caseFile});

  final CaseFile caseFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evidenceAsync = ref.watch(evidenceListProvider(caseFile.id));
    final sessionsAsync = ref.watch(recordingSessionsProvider(caseFile.id));

    return sessionsAsync.when(
      data: (sessions) {
        final activeSession = sessions.isNotEmpty
            ? RecordingSessionId(sessions.first.id)
            : null;
        if (activeSession == null) {
          return const Center(child: Text('No sessions to map yet.'));
        }
        final pointsAsync = ref.watch(pathPointsProvider(activeSession));
        return evidenceAsync.when(
          data: (evidence) {
            return pointsAsync.when(
              data: (points) {
                final markers = evidence
                    .map(
                      (item) => Marker(
                        point: LatLng(
                          item.location.latitude,
                          item.location.longitude,
                        ),
                        width: 40,
                        height: 40,
                        child: Tooltip(
                          message: item.type.name.toUpperCase(),
                          child: const Icon(Icons.location_on, color: Colors.red),
                        ),
                      ),
                    )
                    .toList();

                final polyline = Polyline(
                  points: points
                      .map(
                        (p) => LatLng(
                          p.location.latitude,
                          p.location.longitude,
                        ),
                      )
                      .toList(),
                  color: Colors.blueAccent,
                  strokeWidth: 4,
                );

                final initial = evidence.isNotEmpty
                    ? LatLng(
                        evidence.first.location.latitude,
                        evidence.first.location.longitude,
                      )
                    : LatLng(
                        caseFile.initialLocation.latitude,
                        caseFile.initialLocation.longitude,
                      );

                return FlutterMap(
                  options: MapOptions(
                    initialCenter: initial,
                    initialZoom: 16,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: 'com.scsi.app',
                    ),
                    PolylineLayer(polylines: [polyline]),
                    MarkerLayer(markers: markers),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Error: $error')),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class AuditTab extends ConsumerWidget {
  const AuditTab({super.key, required this.caseFile});

  final CaseFile caseFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(auditListProvider(caseFile.id)).when(
      data: (events) {
        if (events.isEmpty) {
          return const Center(child: Text('No audit events recorded.'));
        }
        return ListView.separated(
          itemCount: events.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final event = events[index];
            return ListTile(
              title: Text(event.action.name),
              subtitle: Text(event.occurredAt.utc.toLocal().toString()),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class ReportsTab extends ConsumerWidget {
  const ReportsTab({super.key, required this.caseFile});

  final CaseFile caseFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(reportListProvider(caseFile.id)).when(
      data: (reports) {
        if (reports.isEmpty) {
          return const Center(child: Text('No reports generated.'));
        }
        return ListView.separated(
          itemCount: reports.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final report = reports[index];
            return ListTile(
              title: Text('Report ${report.generatedAt.utc.toLocal()}'),
              subtitle: Text(report.pdfFile.path),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class AudioRecorderDialog extends StatefulWidget {
  const AudioRecorderDialog({super.key, required this.record, required this.outputPath});

  final AudioRecorder record;
  final String outputPath;

  @override
  State<AudioRecorderDialog> createState() => _AudioRecorderDialogState();
}

class _AudioRecorderDialogState extends State<AudioRecorderDialog> {
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    final canRecord = await widget.record.hasPermission();
    if (!canRecord) {
      if (mounted) Navigator.of(context).pop();
      return;
    }
    await widget.record.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: widget.outputPath,
    );
    if (mounted) {
      setState(() {
        _isRecording = true;
      });
    }
  }

  Future<void> _stop() async {
    await widget.record.stop();
    if (mounted) {
      setState(() {
        _isRecording = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recording Audio'),
      content: Text(_isRecording ? 'Recording...' : 'Preparing...'),
      actions: [
        ElevatedButton(
          onPressed: _isRecording ? _stop : null,
          child: const Text('Stop'),
        ),
      ],
    );
  }
}
