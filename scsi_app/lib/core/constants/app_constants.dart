/// Application-wide constants
class AppConstants {
  // App Info
  static const String appName = 'SCSI';
  static const String appVersion = '1.0.0';
  
  // Database
  static const String databaseName = 'scsi_encrypted.db';
  static const int databaseVersion = 1;
  
  // Video Recording
  static const int videoSegmentDurationMinutes = 10;
  static const int videoBitrate = 8000000; // 8 Mbps
  static const int videoWidth = 1920;
  static const int videoHeight = 1080;
  static const int videoFrameRate = 30;
  static const int audioBitrate = 128000; // 128 kbps
  
  // YOLO Detection
  static const String yoloModelPath = 'assets/models/yolov8n.tflite';
  static const int yoloInputSize = 640;
  static const double yoloConfidenceThreshold = 0.25;
  static const double yoloIouThreshold = 0.45;
  static const int yoloMaxDetections = 100;
  
  // Location Tracking
  static const int locationUpdateIntervalSeconds = 30;
  static const double locationAccuracyMeters = 10.0;
  
  // Security
  static const String secureStorageKeyPrefix = 'scsi_';
  static const String databaseEncryptionKeyName = 'db_encryption_key';
  static const int secureDeletePasses = 3;
  
  // Chain of Custody
  static const String hashAlgorithm = 'SHA-256';
  
  // Report Generation
  static const String reportFilePrefix = 'SCSI_Report_';
  static const String reportDateFormat = 'yyyy-MM-dd_HH-mm-ss';
  
  // Permissions
  static const List<String> requiredPermissions = [
    'android.permission.CAMERA',
    'android.permission.RECORD_AUDIO',
    'android.permission.ACCESS_FINE_LOCATION',
    'android.permission.ACCESS_COARSE_LOCATION',
    'android.permission.FOREGROUND_SERVICE',
    'android.permission.FOREGROUND_SERVICE_CAMERA',
    'android.permission.FOREGROUND_SERVICE_MICROPHONE',
    'android.permission.FOREGROUND_SERVICE_LOCATION',
    'android.permission.WAKE_LOCK',
    'android.permission.POST_NOTIFICATIONS',
  ];
}
