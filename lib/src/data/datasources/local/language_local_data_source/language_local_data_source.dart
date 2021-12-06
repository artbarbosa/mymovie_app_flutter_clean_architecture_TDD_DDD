abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String languageCode);
  Future<String> getPreferredLanguage();
  Future<void> updateTheme(String themeName);
  Future<String> getPreferredTheme();
}