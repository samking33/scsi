import 'package:drift/drift.dart';
import 'package:scsi/core/data/scsi_database.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/geospatial/domain/entities/officer_path_point.dart';
import 'package:scsi/features/geospatial/domain/repositories/geospatial_repository.dart';

class GeospatialRepositoryImpl implements GeospatialRepository {
  GeospatialRepositoryImpl(this._db);

  final ScsiDatabase _db;

  @override
  Future<void> addPathPoints({
    required RecordingSessionId sessionId,
    required List<OfficerPathPoint> points,
  }) async {
    if (points.isEmpty) return;
    await _db.batch((batch) {
      batch.insertAll(
        _db.officerPathPoints,
        points
            .map(
              (point) => OfficerPathPointsCompanion.insert(
                sessionId: sessionId.value,
                latitude: point.location.latitude,
                longitude: point.location.longitude,
                altitude: Value(point.location.altitudeMeters),
                accuracy: Value(point.location.accuracyMeters),
                heading: Value(point.location.headingDegrees),
                speed: Value(point.location.speedMetersPerSecond),
                timestamp: point.location.timestamp.epochMillis,
              ),
            )
            .toList(),
      );
    });
  }

  @override
  Future<List<OfficerPathPoint>> listPathPoints(RecordingSessionId sessionId) async {
    final rows = await (_db.select(_db.officerPathPoints)
          ..where((tbl) => tbl.sessionId.equals(sessionId.value))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.timestamp)]))
        .get();
    return rows
        .map(
          (row) => OfficerPathPoint(
            sessionId: RecordingSessionId(row.sessionId),
            location: pointToLocation(row),
          ),
        )
        .toList();
  }

  GeoLocation pointToLocation(OfficerPathPointRecord row) {
    return GeoLocation(
      latitude: row.latitude,
      longitude: row.longitude,
      altitudeMeters: row.altitude,
      accuracyMeters: row.accuracy,
      headingDegrees: row.heading,
      speedMetersPerSecond: row.speed,
      timestamp: Timestamp.from(
        DateTime.fromMillisecondsSinceEpoch(row.timestamp, isUtc: true),
      ),
    );
  }
}
