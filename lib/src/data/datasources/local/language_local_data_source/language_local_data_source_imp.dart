import 'dart:async';

import 'package:hive/hive.dart';

import 'language_local_data_source.dart';

class LanguageLocalDataSourceImp implements LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final languageBox = await Hive.openBox('languageBox');
    return languageBox.get('preferred_language') ?? 'en';
  }

  @override
  Future<String> getPreferredTheme() async {
    final themeBox = await Hive.openBox('themeBox');
    return themeBox.get('preferred_theme') ?? 'dark';
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    final languageBox = await Hive.openBox('languageBox');
    unawaited(languageBox.put('preferred_language', languageCode));
  }

  @override
  Future<void> updateTheme(String themeName) async {
    final themeBox = await Hive.openBox('themeBox');
    unawaited(themeBox.put('preferred_theme', themeName));
  }
}