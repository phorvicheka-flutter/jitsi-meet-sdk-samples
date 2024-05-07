import 'package:flutter/material.dart';

abstract class AppColors {
  static const int _primaryColorValue = 0xFF2C5DA7;

  // Example of colors generated from http://mcg.mbitson.com/
  static const MaterialColor primary = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFE6ECF4),
      100: Color(0xFFC0CEE5),
      200: Color(0xFF96AED3),
      300: Color(0xFF6B8EC1),
      400: Color(0xFF4C75B4),
      500: Color(_primaryColorValue),
      600: Color(0xFF27559F),
      700: Color(0xFF214B96),
      800: Color(0xFF1B418C),
      900: Color(0xFF10307C),
    },
  );

  static const seedColor = Color(_primaryColorValue);
}
