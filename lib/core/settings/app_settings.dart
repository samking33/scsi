class AppSettings {
  const AppSettings({
    required this.aiServerBaseUrl,
  });

  final String aiServerBaseUrl;

  AppSettings copyWith({String? aiServerBaseUrl}) {
    return AppSettings(
      aiServerBaseUrl: aiServerBaseUrl ?? this.aiServerBaseUrl,
    );
  }

  static const AppSettings defaults = AppSettings(
    aiServerBaseUrl: 'http://10.0.2.2:8000',
  );
}
