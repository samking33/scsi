import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import '../error/exceptions.dart';

/// Cryptographic utilities for hashing and integrity verification
class CryptoUtils {
  /// Generate SHA-256 hash of a file
  static Future<String> hashFile(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw FileSystemException('File not found: $filePath');
      }
      
      final bytes = await file.readAsBytes();
      return hashBytes(bytes);
    } catch (e) {
      throw EncryptionException(
        'Failed to hash file',
        originalError: e,
      );
    }
  }
  
  /// Generate SHA-256 hash of bytes
  static String hashBytes(Uint8List bytes) {
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  /// Generate SHA-256 hash of a string
  static String hashString(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  /// Verify file integrity by comparing hash
  static Future<bool> verifyFileIntegrity(
    String filePath,
    String expectedHash,
  ) async {
    try {
      final actualHash = await hashFile(filePath);
      return actualHash == expectedHash;
    } catch (e) {
      return false;
    }
  }
  
  /// Generate a unique ID based on timestamp and random data
  static String generateUniqueId() {
    final timestamp = DateTime.now().toUtc().millisecondsSinceEpoch;
    final random = List<int>.generate(16, (i) => timestamp % 256);
    final digest = sha256.convert(random);
    return digest.toString().substring(0, 32);
  }
  /// Generate hash for chain of custody
  /// Hash = SHA256(previousHash + data)
  static String generateChainHash({
    required String previousHash,
    required String data,
  }) {
    return hashString(previousHash + data);
  }
}
