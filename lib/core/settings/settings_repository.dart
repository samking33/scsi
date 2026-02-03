import 'package:shared_preferences/shared_preferences.dart';
import 'package:scsi/core/settings/app_settings.dart';

class SettingsRepository {
  static const _keyAiBaseUrl = 'ai_base_url';

  Future<AppSettings> load() async {
    final prefs = await SharedPreferences.getInstance();
    final url = prefs.getString(_keyAiBaseUrl) ?? AppSettings.defaults.aiServerBaseUrl;
    return AppSettings(aiServerBaseUrl: url);
  }

  Future<void> updateAiServerBaseUrl(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAiBaseUrl, value);
  }
}
