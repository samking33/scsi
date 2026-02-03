/// Custom exception types for the application
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  
  const AppException(this.message, {this.code, this.originalError});
  
  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Database-related errors
class DatabaseException extends AppException {
  const DatabaseException(super.message, {super.code, super.originalError});
}

/// Encryption/decryption errors
class EncryptionException extends AppException {
  const EncryptionException(super.message, {super.code, super.originalError});
}

/// Permission-related errors
class PermissionException extends AppException {
  const PermissionException(super.message, {super.code, super.originalError});
}

/// Camera/video recording errors
class RecordingException extends AppException {
  const RecordingException(super.message, {super.code, super.originalError});
}

/// Location service errors
class LocationException extends AppException {
  const LocationException(super.message, {super.code, super.originalError});
}

/// AI/ML inference errors
class InferenceException extends AppException {
  const InferenceException(super.message, {super.code, super.originalError});
}

/// Chain of custody integrity errors
class IntegrityException extends AppException {
  const IntegrityException(super.message, {super.code, super.originalError});
}

/// File system errors
class FileSystemException extends AppException {
  const FileSystemException(super.message, {super.code, super.originalError});
}

/// Security-related errors
class SecurityException extends AppException {
  const SecurityException(super.message, {super.code, super.originalError});
}
