import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:scsi/app/providers.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/enums/audit_action.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/chain_of_custody/domain/entities/audit_event.dart';
import 'package:scsi/features/evidence/domain/entities/evidence_item.dart';
import 'package:scsi/features/evidence/domain/value_objects/recording_config.dart';
import 'package:scsi/features/geospatial/domain/entities/officer_path_point.dart';
import 'package:scsi/features/timeline/domain/entities/timeline_entry.dart';

class RecordingState {
  const RecordingState({
    required this.isRecording,
    this.session,
    this.startedAt,
  });

  final bool isRecording;
  final RecordingSession? session;
  final Timestamp? startedAt;

  RecordingState copyWith({
    bool? isRecording,
    RecordingSession? session,
    Timestamp? startedAt,
  }) {
    return RecordingState(
      isRecording: isRecording ?? this.isRecording,
      session: session ?? this.session,
      startedAt: startedAt ?? this.startedAt,
    );
  }

  static const RecordingState idle = RecordingState(isRecording: false);
}

final recordingControllerProvider =
    StateNotifierProvider<RecordingController, RecordingState>((ref) {
  return RecordingController(ref);
});

class RecordingController extends StateNotifier<RecordingState> {
  RecordingController(this._ref) : super(RecordingState.idle);

  final Ref _ref;
  StreamSubscription? _locationSub;

  @override
  void dispose() {
    _locationSub?.cancel();
    super.dispose();
  }

  Future<void> startRecording({
    required CaseId caseId,
    required OfficerId officerId,
  }) async {
    if (state.isRecording) return;

    final recordingRepository = _ref.read(recordingRepositoryProvider);
    final config = RecordingConfig.standardEvidence();

    final session = await recordingRepository.startSession(
      caseId: caseId,
      officerId: officerId,
      config: config,
    );

    final startedAt = Timestamp.nowUtc();
    state = RecordingState(isRecording: true, session: session, startedAt: startedAt);

    await _insertRecordingSession(session, startedAt);
    await _appendAuditEvent(caseId, officerId, AuditAction.recordingStarted);
    await _addTimelineEntry(
      session: session,
      type: TimelineEntryType.recordingStart,
      evidenceId: null,
    );

    await _startLocationTracking(session.id);
  }

  Future<void> stopRecording({required OfficerId officerId}) async {
    if (!state.isRecording || state.session == null) return;
    final session = state.session!;
    final repository = _ref.read(recordingRepositoryProvider);
    await repository.stopSession();

    await _updateRecordingSessionEnded(session.id, officerId);
    await _appendAuditEvent(session.caseId, officerId, AuditAction.recordingStopped);
    await _addTimelineEntry(
      session: session,
      type: TimelineEntryType.recordingStop,
      evidenceId: null,
    );

    await _locationSub?.cancel();
    _locationSub = null;
    state = RecordingState.idle;
  }

  Duration videoOffset() {
    final start = state.startedAt?.utc;
    if (start == null) return Duration.zero;
    return DateTime.now().toUtc().difference(start);
  }

  Future<void> _startLocationTracking(RecordingSessionId sessionId) async {
    final locationService = _ref.read(locationServiceProvider);
    _locationSub = locationService.locationStream().listen((location) {
      final repo = _ref.read(geospatialRepositoryProvider);
      repo.addPathPoints(
        sessionId: sessionId,
        points: [OfficerPathPoint(sessionId: sessionId, location: location)],
      );
    });
  }

  Future<void> _insertRecordingSession(RecordingSession session, Timestamp startedAt) async {
    final db = _ref.read(databaseProvider);
    await db.into(db.recordingSessions).insert(
          RecordingSessionsCompanion.insert(
            id: session.id.value,
            caseId: session.caseId.value,
            startedAt: startedAt.epochMillis,
            startedBy: session.startedBy.value,
            endedAt: const drift.Value.absent(),
            endedBy: const drift.Value.absent(),
          ),
        );
  }

  Future<void> _updateRecordingSessionEnded(
    RecordingSessionId sessionId,
    OfficerId officerId,
  ) async {
    final db = _ref.read(databaseProvider);
    await (db.update(db.recordingSessions)
          ..where((tbl) => tbl.id.equals(sessionId.value)))
        .write(
      RecordingSessionsCompanion(
        endedAt: drift.Value(Timestamp.nowUtc().epochMillis),
        endedBy: drift.Value(officerId.value),
      ),
    );
  }

  Future<void> _appendAuditEvent(
    CaseId caseId,
    OfficerId officerId,
    AuditAction action,
  ) async {
    final auditRepo = _ref.read(auditRepositoryProvider);
    final latest = await auditRepo.latestEvent(caseId);
    final sequence = (latest?.sequence ?? 0) + 1;
    final previous = latest?.hash ?? const HashDigest('');
    final event = AuditEvent.create(
      id: IdFactory.newAuditEventId(),
      caseId: caseId,
      sequence: sequence,
      action: action,
      occurredAt: Timestamp.nowUtc(),
      details: {
        'action': action.name,
      },
      previousHash: previous,
      actorId: officerId,
    );
    await auditRepo.appendEvent(event);
  }

  Future<void> _addTimelineEntry({
    required RecordingSession session,
    required TimelineEntryType type,
    EvidenceId? evidenceId,
  }) async {
    final repo = _ref.read(timelineRepositoryProvider);
    final entry = TimelineEntry(
      id: IdFactory.newEvidenceId().value,
      caseId: session.caseId,
      sessionId: session.id,
      type: type,
      occurredAt: Timestamp.nowUtc(),
      videoOffset: videoOffset(),
      evidenceId: evidenceId,
    );
    await repo.addEntry(entry);
  }
}
