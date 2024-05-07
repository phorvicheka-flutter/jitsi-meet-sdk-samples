import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_settings.dart';
import '../../constants/shared_preferences_keys.dart';
import '../models/user/user.dart';

class SharedPreferencesHelper {
  // shared pref instance
  final SharedPreferences _sharedPreferences;

  // constructor
  SharedPreferencesHelper(this._sharedPreferences);

  /* ------------------------- Clear SharedPreferences ------------------------ */
  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  /* -------------------------------- authToken ------------------------------- */
  String? get authToken {
    return _sharedPreferences.getString(SharedPreferencesKeys.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreferences.setString(
      SharedPreferencesKeys.authToken,
      authToken,
    );
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreferences.remove(SharedPreferencesKeys.authToken);
  }

  /* ---------------------------------- user ---------------------------------- */
  User? get user {
    String? userJsonString =
        _sharedPreferences.getString(SharedPreferencesKeys.user);

    if (userJsonString == null) {
      return null;
    } else {
      Map<String, dynamic> userJsonObject = json.decode(userJsonString);
      return User.fromJson(userJsonObject);
    }
  }

  Future<bool> saveUser(User user) async {
    Map<String, dynamic> userJsonObject = user.toJson();
    String userJsonString = json.encode(userJsonObject);

    return _sharedPreferences.setString(
      SharedPreferencesKeys.user,
      userJsonString,
    );
  }

  Future<bool> removeUser() async {
    return _sharedPreferences.remove(SharedPreferencesKeys.user);
  }

  Future<bool> saveUserAndAuthToken(User user, String authToken) async {
    try {
      await saveUser(user);
      await saveAuthToken(authToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeUserAndAuthToken() async {
    try {
      await removeUser();
      await removeAuthToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get isLoggedIn {
    return user == null ? false : true;
  }

  /* -------------------------------- App Theme ------------------------------- */
  ThemeMode get themeMode {
    String? savedThemeModeName =
        _sharedPreferences.getString(SharedPreferencesKeys.themeModeName);
    final savedThemeMode = ThemeMode.values.firstWhere(
      (element) => element.name == savedThemeModeName,
      orElse: () => AppSettings.defaultThemeMode,
    );
    return savedThemeMode;
  }

  Future<bool> saveThemeModeName(ThemeMode themeMode) async {
    return _sharedPreferences.setString(
      SharedPreferencesKeys.themeModeName,
      themeMode.name,
    );
  }

  Color get themeSeedColorValue {
    final int? savedThemeSeedColorValue =
        _sharedPreferences.getInt(SharedPreferencesKeys.themeSeedColorValue);
    return savedThemeSeedColorValue != null
        ? Color(savedThemeSeedColorValue)
        : AppSettings.defaultAppSeedColor;
  }

  Future<bool> saveThemeSeedColorValue(int seedColorValue) async {
    return _sharedPreferences.setInt(
      SharedPreferencesKeys.themeSeedColorValue,
      seedColorValue,
    );
  }

  /* -------------------------------- App Locale ------------------------------- */
  Locale get locale {
    final String languageCode =
        _sharedPreferences.getString(SharedPreferencesKeys.languageCode) ??
            AppSettings.defaultLanguageCode;
    switch (languageCode) {
      case AppSettings.lauguageCodeEn:
        return Locale(languageCode, AppSettings.countryCodeUs);
      default:
        return Locale(languageCode);
    }
  }

  Future<bool> saveLanguageCode(String languageCode) async {
    return _sharedPreferences.setString(
      SharedPreferencesKeys.languageCode,
      languageCode,
    );
  }
}
