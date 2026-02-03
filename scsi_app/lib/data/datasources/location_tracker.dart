import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/error/exceptions.dart';

/// Location tracking service for officer movement and evidence GPS tagging
class LocationTracker {
  static LocationTracker? _instance;
  
  LocationTracker._();
  
  factory LocationTracker() {
    _instance ??= LocationTracker._();
    return _instance!;
  }
  
  Stream<Position>? _positionStream;
  
  /// Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
  
  /// Check location permission status
  Future<bool> hasLocationPermission() async {
    final permission = await Permission.location.status;
    return permission.isGranted;
  }
  
  /// Request location permission
  Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }
  
  /// Get current location
  Future<Position> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      final serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw LocationException('Location services are disabled');
      }
      
      // Check permission
      final hasPermission = await hasLocationPermission();
      if (!hasPermission) {
        final granted = await requestLocationPermission();
        if (!granted) {
          throw LocationException('Location permission denied');
        }
      }
      
      // Get current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      if (e is LocationException) rethrow;
      throw LocationException(
        'Failed to get current location',
        originalError: e,
      );
    }
  }
  
  /// Start tracking location updates
  Stream<Position> startTracking({
    int distanceFilterMeters = 10,
    int intervalSeconds = 30,
  }) {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilterMeters,
        timeLimit: Duration(seconds: intervalSeconds),
      ),
    );
    
    return _positionStream!;
  }
  
  /// Stop tracking location updates
  void stopTracking() {
    _positionStream = null;
  }
  
  /// Calculate distance between two points in meters
  double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }
}
