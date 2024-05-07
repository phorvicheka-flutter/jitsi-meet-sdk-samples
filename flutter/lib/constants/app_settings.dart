import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppSettings {
  static const ThemeMode defaultThemeMode = ThemeMode.system;
  static const Color defaultAppSeedColor = AppColors.seedColor;
  //languages code
  static const String defaultLanguageCode = 'en';
  static const String lauguageCodeEn = 'en';
  static const String lauguageCodeKo = 'ko';
  static const String countryCodeUs = 'US';
}
