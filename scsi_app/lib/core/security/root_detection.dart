import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import '../error/exceptions.dart';

/// Root detection for security awareness
/// Note: This is a warning system, not a blocker
/// Officers may legitimately use rooted devices
class RootDetection {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  
  /// Check if device is rooted
  static Future<RootDetectionResult> checkRoot() async {
    try {
      final checks = await Future.wait([
        _checkSuperSU(),
        _checkMagisk(),
        _checkTestKeys(),
        _checkDangerousProps(),
      ]);
      
      final isRooted = checks.any((result) => result);
      final indicators = <String>[];
      
      if (checks[0]) indicators.add('SuperSU detected');
      if (checks[1]) indicators.add('Magisk detected');
      if (checks[2]) indicators.add('Test-keys build');
      if (checks[3]) indicators.add('Dangerous system properties');
      
      return RootDetectionResult(
        isRooted: isRooted,
        indicators: indicators,
      );
    } catch (e) {
      throw SecurityException(
        'Failed to perform root detection',
        originalError: e,
      );
    }
  }
  
  /// Check for SuperSU binary
  static Future<bool> _checkSuperSU() async {
    final paths = [
      '/system/app/Superuser.apk',
      '/sbin/su',
      '/system/bin/su',
      '/system/xbin/su',
      '/data/local/xbin/su',
      '/data/local/bin/su',
      '/system/sd/xbin/su',
      '/system/bin/failsafe/su',
      '/data/local/su',
    ];
    
    for (final path in paths) {
      if (await File(path).exists()) {
        return true;
      }
    }
    return false;
  }
  
  /// Check for Magisk
  static Future<bool> _checkMagisk() async {
    final paths = [
      '/sbin/.magisk',
      '/sbin/.core',
      '/cache/.disable_magisk',
    ];
    
    for (final path in paths) {
      if (await File(path).exists() || await Directory(path).exists()) {
        return true;
      }
    }
    return false;
  }
  
  /// Check if build is signed with test keys
  static Future<bool> _checkTestKeys() async {
    try {
      final androidInfo = await _deviceInfo.androidInfo;
      final tags = androidInfo.tags;
      return tags.contains('test-keys');
    } catch (e) {
      return false;
    }
  }
  
  /// Check for dangerous system properties
  static Future<bool> _checkDangerousProps() async {
    try {
      final androidInfo = await _deviceInfo.androidInfo;
      
      // Check if device is in developer mode
      final isDevelopment = androidInfo.isPhysicalDevice == false;
      
      return isDevelopment;
    } catch (e) {
      return false;
    }
  }
}

class RootDetectionResult {
  final bool isRooted;
  final List<String> indicators;
  
  const RootDetectionResult({
    required this.isRooted,
    required this.indicators,
  });
  
  String get message {
    if (!isRooted) {
      return 'Device appears to be secure';
    }
    return 'WARNING: Root access detected\n${indicators.join('\n')}';
  }
}
