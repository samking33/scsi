import 'package:shared_preferences/shared_preferences.dart';
import 'package:scsi/core/settings/app_settings.dart';

class SettingsRepository {
  static const _keyAiBaseUrl = 'ai_base_url';
  static const _keySessionDirs = 'session_dirs';

  Future<AppSettings> load() async {
    final prefs = await SharedPreferences.getInstance();
    final url = prefs.getString(_keyAiBaseUrl) ?? AppSettings.defaults.aiServerBaseUrl;
    return AppSettings(aiServerBaseUrl: url);
  }

  Future<void> updateAiServerBaseUrl(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAiBaseUrl, value);
  }

  Future<void> setSessionDir(String sessionId, String sessionDir) async {
    final prefs = await SharedPreferences.getInstance();
    final map = prefs.getString(_keySessionDirs);
    final decoded = map == null ? <String, String>{} : Map<String, String>.from(_decode(map));
    decoded[sessionId] = sessionDir;
    await prefs.setString(_keySessionDirs, _encode(decoded));
  }

  Future<String?> getSessionDir(String sessionId) async {
    final prefs = await SharedPreferences.getInstance();
    final map = prefs.getString(_keySessionDirs);
    if (map == null) return null;
    final decoded = Map<String, String>.from(_decode(map));
    return decoded[sessionId];
  }

  String _encode(Map<String, String> map) => map.entries.map((e) => '${e.key}|${e.value}').join(';;');

  Map<String, String> _decode(String raw) {
    final result = <String, String>{};
    if (raw.isEmpty) return result;
    for (final entry in raw.split(';;')) {
      final parts = entry.split('|');
      if (parts.length >= 2) {
        final key = parts.first;
        final value = parts.sublist(1).join('|');
        result[key] = value;
      }
    }
    return result;
  }
}
