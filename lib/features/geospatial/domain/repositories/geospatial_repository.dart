import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/features/geospatial/domain/entities/officer_path_point.dart';

abstract class GeospatialRepository {
  Future<void> addPathPoints({
    required RecordingSessionId sessionId,
    required List<OfficerPathPoint> points,
  });

  Future<List<OfficerPathPoint>> listPathPoints(RecordingSessionId sessionId);
}
