import 'package:flutter/material.dart';

import '../data/repositories/app_settings_repository.dart';

class AppSettingsChangeNotifier extends ChangeNotifier {
  final AppSettingsRepository appSettingsRepository;

  AppSettingsChangeNotifier(this.appSettingsRepository);

  /* -------------------------------- App Theme ------------------------------- */
  ThemeMode get themeMode {
    return appSettingsRepository.themeMode;
  }

  Color get themeSeedColor {
    return appSettingsRepository.themeSeedColor;
  }

  Future<void> setThemeModeToLight() async {
    await appSettingsRepository.setThemeModeToLight();
    notifyListeners();
  }

  Future<void> setThemeModeToDark() async {
    await appSettingsRepository.setThemeModeToDark();
    notifyListeners();
  }

  Future<void> setThemeSeedColor(Color color) async {
    await appSettingsRepository.setThemeSeedColor(color);
    notifyListeners();
  }

  /* -------------------------------- App Locale ------------------------------- */
  Locale get locale {
    return appSettingsRepository.locale;
  }

  Future<void> saveLanguageCode(String languageCode) async {
    await appSettingsRepository.saveLanguageCode(languageCode);
    notifyListeners();
  }
}
