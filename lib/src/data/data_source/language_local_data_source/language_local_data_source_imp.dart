 import 'language_local_data_source.dart';

class LanguageLocalDataSourceImp implements LanguageLocalDataSource {

  @override
  Future<String> getPreferredLanguage() {
    throw UnimplementedError();
  }

  @override
  Future<String> getPreferredTheme() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateLanguage(String languageCode) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTheme(String themeName) {
    throw UnimplementedError();
  }

}
