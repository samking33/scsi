import 'dart:io';
import 'dart:math';
import '../error/exceptions.dart';

/// Secure file deletion with overwrite
/// Overwrites file contents multiple times before deletion
class SecureDeletion {
  /// Securely delete a file
  /// Overwrites with random data multiple times to prevent recovery
  static Future<void> secureDelete(String filePath, {int passes = 3}) async {
    try {
      final file = File(filePath);
      
      if (!await file.exists()) {
        throw FileSystemException('File not found: $filePath');
      }
      
      final fileSize = await file.length();
      final random = Random.secure();
      
      // Overwrite file multiple times
      for (int pass = 0; pass < passes; pass++) {
        final randomData = List<int>.generate(
          fileSize,
          (_) => random.nextInt(256),
        );
        
        await file.writeAsBytes(randomData, flush: true);
      }
      
      // Finally delete the file
      await file.delete();
    } catch (e) {
      throw FileSystemException(
        'Failed to securely delete file',
        originalError: e,
      );
    }
  }
  
  /// Securely delete multiple files
  static Future<void> secureDeleteMultiple(List<String> filePaths) async {
    for (final path in filePaths) {
      await secureDelete(path);
    }
  }
}
