import 'package:flutter/material.dart';

import '../shared_preferences/shared_preferences_helper.dart';

class AppSettingsRepository {
  final SharedPreferencesHelper sharedPreferencesHelper;
  // injecting dio instance
  AppSettingsRepository(this.sharedPreferencesHelper);

  /* -------------------------------- App Theme ------------------------------- */
  ThemeMode get themeMode {
    return sharedPreferencesHelper.themeMode;
  }

  Color get themeSeedColor {
    return sharedPreferencesHelper.themeSeedColorValue;
  }

  Future<void> setThemeModeToLight() async {
    await sharedPreferencesHelper.saveThemeModeName(ThemeMode.light);
  }

  Future<void> setThemeModeToDark() async {
    await sharedPreferencesHelper.saveThemeModeName(ThemeMode.dark);
  }

  Future<void> setThemeSeedColor(Color color) async {
    await sharedPreferencesHelper.saveThemeSeedColorValue(color.value);
  }

  /* -------------------------------- App Locale ------------------------------- */
  Locale get locale {
    return sharedPreferencesHelper.locale;
  }

  Future<void> saveLanguageCode(String languageCode) async {
    await sharedPreferencesHelper.saveLanguageCode(languageCode);
  }
}
