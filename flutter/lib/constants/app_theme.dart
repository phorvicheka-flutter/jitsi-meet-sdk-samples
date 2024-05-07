import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'dimens.dart';
import 'font_family.dart';

abstract class AppTheme {
  static ThemeData lightTheme(
    ColorScheme? lightColorScheme, {
    String languageCode = 'en',
    Color seedColor = AppColors.seedColor,
  }) {
    // https://github.com/flutter/samples/blob/main/material_3_demo/lib/main.dart
    // https://github.com/flutter/gallery/tree/main/lib/themes
    return _generateThemeData(
      _generateColorScheme(
        lightColorScheme,
        brightness: Brightness.light,
        seedColor: seedColor,
      ),
      _generateFontFamily(
        languageCode: languageCode,
      ),
      _generateTextTheme(
        languageCode: languageCode,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData darkTheme(
    ColorScheme? darkColorScheme, {
    String languageCode = 'en',
    Color seedColor = AppColors.seedColor,
  }) {
    return _generateThemeData(
      _generateColorScheme(
        darkColorScheme,
        brightness: Brightness.dark,
        seedColor: seedColor,
      ),
      _generateFontFamily(
        languageCode: languageCode,
      ),
      _generateTextTheme(
        languageCode: languageCode,
        brightness: Brightness.dark,
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                                 Theme Data                                 */
  /* -------------------------------------------------------------------------- */
  static ThemeData _generateThemeData(
    ColorScheme colorScheme,
    String fontFamily,
    TextTheme textTheme,
  ) {
    return ThemeData(
      useMaterial3: true,
      // Define the default brightness and colors.
      colorScheme: colorScheme,

      // Define the default font family.
      fontFamily: fontFamily,

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: textTheme,

      // override specific component theme
      appBarTheme: AppBarTheme(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.spaceXs),
          ),
        ),
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                                Color scheme                                */
  /* -------------------------------------------------------------------------- */
  static ColorScheme _generateColorScheme(
    ColorScheme? colorScheme, {
    required Color seedColor,
    Brightness brightness = Brightness.light,
  }) {
    return colorScheme ??
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: brightness,

          // override specific colors
          // primary: seedColor,
          secondary: AppColors.primary[900],
        );
  }

  /* -------------------------------------------------------------------------- */
  /*                                 Font Family                                */
  /* -------------------------------------------------------------------------- */
  static String _generateFontFamily({
    String languageCode = 'en',
  }) {
    String fontFamily;
    switch (languageCode) {
      case 'en':
        fontFamily = FontFamily.openSans;
        break;
      case 'ko':
        fontFamily = FontFamily.nanumMyeongjo;
        break;
      default:
        fontFamily = FontFamily.openSans;
    }

    return fontFamily;
  }

  /* -------------------------------------------------------------------------- */
  /*                                 Text theme                                 */
  /* -------------------------------------------------------------------------- */
  // static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  // static const _bold = FontWeight.w700;

  static TextTheme _generateTextThemeKo(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      titleMedium: GoogleFonts.gothicA1(
        fontWeight: _semiBold,
        fontSize: baseTextTheme.titleLarge?.fontSize,
        color: baseTextTheme.titleLarge?.color,
      ),
      bodyMedium: GoogleFonts.nanumMyeongjo(
        fontWeight: _regular,
        fontSize: baseTextTheme.bodyMedium?.fontSize,
        color: baseTextTheme.bodyMedium?.color,
      ),
    );
  }

  static TextTheme _generateTextThemeEn(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      titleMedium: GoogleFonts.openSans(
        fontWeight: _semiBold,
        fontSize: baseTextTheme.titleLarge?.fontSize,
        color: baseTextTheme.titleLarge?.color,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: baseTextTheme.bodyMedium?.fontSize,
        color: baseTextTheme.bodyMedium?.color,
      ),
    );
  }

  static TextTheme _generateTextTheme({
    String languageCode = 'en',
    Brightness brightness = Brightness.light,
  }) {
    TextTheme textTheme;
    TextTheme baseTextTheme = brightness == Brightness.light
        ? Typography.material2021().black
        : Typography.material2021().white;

    switch (languageCode) {
      case 'en':
        textTheme = _generateTextThemeEn(baseTextTheme);
        break;
      case 'ko':
        textTheme = _generateTextThemeKo(baseTextTheme);
        break;
      default:
        textTheme = _generateTextThemeEn(baseTextTheme);
    }

    return textTheme;
  }
}
