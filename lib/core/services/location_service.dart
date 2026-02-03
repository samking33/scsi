import 'package:geolocator/geolocator.dart';
import 'package:scsi/core/domain/value_objects/geo_location.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class LocationService {
  Future<bool> ensurePermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<GeoLocation?> currentLocation() async {
    final allowed = await ensurePermission();
    if (!allowed) return null;
    final position = await Geolocator.getCurrentPosition();
    return GeoLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      altitudeMeters: position.altitude,
      accuracyMeters: position.accuracy,
      headingDegrees: position.heading,
      speedMetersPerSecond: position.speed,
      timestamp: Timestamp.from(position.timestamp),
    );
  }

  Stream<GeoLocation> locationStream() async* {
    final allowed = await ensurePermission();
    if (!allowed) return;
    final stream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 2,
      ),
    );
    await for (final position in stream) {
      yield GeoLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        altitudeMeters: position.altitude,
        accuracyMeters: position.accuracy,
        headingDegrees: position.heading,
        speedMetersPerSecond: position.speed,
      timestamp: Timestamp.from(position.timestamp),
      );
    }
  }
}
