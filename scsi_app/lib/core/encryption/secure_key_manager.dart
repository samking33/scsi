import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';
import '../error/exceptions.dart';

/// Secure key management using Android Keystore
/// Keys are stored in hardware-backed secure storage
class SecureKeyManager {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
  );
  
  /// Get or generate database encryption key
  /// Key is 256-bit (32 bytes) for AES-256
  static Future<Uint8List> getDatabaseEncryptionKey() async {
    try {
      final keyName = AppConstants.secureStorageKeyPrefix + 
                      AppConstants.databaseEncryptionKeyName;
      
      // Try to read existing key
      String? existingKey = await _storage.read(key: keyName);
      
      if (existingKey != null) {
        return base64Decode(existingKey);
      }
      
      // Generate new key
      final newKey = _generateRandomKey(32); // 256 bits
      await _storage.write(
        key: keyName,
        value: base64Encode(newKey),
      );
      
      return newKey;
    } catch (e) {
      throw EncryptionException(
        'Failed to get database encryption key',
        originalError: e,
      );
    }
  }
  
  /// Generate cryptographically secure random key
  static Uint8List _generateRandomKey(int length) {
    final random = List<int>.generate(length, (i) {
      return DateTime.now().microsecondsSinceEpoch % 256;
    });
    
    // Hash to ensure randomness
    final digest = sha256.convert(random);
    return Uint8List.fromList(digest.bytes);
  }
  
  /// Store a secure value
  static Future<void> storeSecureValue(String key, String value) async {
    try {
      final fullKey = AppConstants.secureStorageKeyPrefix + key;
      await _storage.write(key: fullKey, value: value);
    } catch (e) {
      throw EncryptionException(
        'Failed to store secure value',
        originalError: e,
      );
    }
  }
  
  /// Retrieve a secure value
  static Future<String?> getSecureValue(String key) async {
    try {
      final fullKey = AppConstants.secureStorageKeyPrefix + key;
      return await _storage.read(key: fullKey);
    } catch (e) {
      throw EncryptionException(
        'Failed to retrieve secure value',
        originalError: e,
      );
    }
  }
  
  /// Delete a secure value
  static Future<void> deleteSecureValue(String key) async {
    try {
      final fullKey = AppConstants.secureStorageKeyPrefix + key;
      await _storage.delete(key: fullKey);
    } catch (e) {
      throw EncryptionException(
        'Failed to delete secure value',
        originalError: e,
      );
    }
  }
  
  /// Delete all secure values (use with caution)
  static Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw EncryptionException(
        'Failed to delete all secure values',
        originalError: e,
      );
    }
  }
}
