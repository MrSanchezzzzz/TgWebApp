import 'package:flutter/material.dart';

class FlutterMidnightNeonTheme {
  static const Color _primaryColor = Color(0xFF6C64BC);
  static const Color _primaryInverseColor = Color(0xFF3C457B);
  static const Color _onSurfaceVariant = Color(0xFF0DFFE7);
  static const Color _onPrimaryColor = Color(0xFFFF7903);
  static const Color _backgroundColor = Color(0xFF373C4B);
  static const Color _onSecondaryColor = Color(0xFFE1E3E4);
  static const Color _onBackgroundColor = Color(0xFF828A9A);
  static const Color _secondaryColor = Color(0xFF05376C);
  static const Color _primaryContainer = Color(0xFF383446);
  static const Color _errorColor = Color(0xFFC1FF05);
  static const Color _onErrorColor = Color(0xFF354157);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: FlutterMidnightNeonTheme._primaryColor,
      primary: FlutterMidnightNeonTheme._primaryColor,
      secondary: FlutterMidnightNeonTheme._secondaryColor,
      inversePrimary: FlutterMidnightNeonTheme._primaryInverseColor,
      onSurface: FlutterMidnightNeonTheme._onBackgroundColor,
      surface: FlutterMidnightNeonTheme._backgroundColor,
      onSurfaceVariant: FlutterMidnightNeonTheme._onSurfaceVariant,
      onPrimary: FlutterMidnightNeonTheme._onPrimaryColor,
      onSecondary: FlutterMidnightNeonTheme._onSecondaryColor,
      primaryContainer: FlutterMidnightNeonTheme._primaryContainer,
      error: FlutterMidnightNeonTheme._errorColor,
      onError: FlutterMidnightNeonTheme._onErrorColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: FlutterMidnightNeonTheme._primaryColor,
      primary: FlutterMidnightNeonTheme._primaryColor,
      secondary: FlutterMidnightNeonTheme._secondaryColor,
      inversePrimary: FlutterMidnightNeonTheme._primaryInverseColor,
      onSurface: FlutterMidnightNeonTheme._onBackgroundColor,
      surface: FlutterMidnightNeonTheme._backgroundColor,
      onSurfaceVariant: FlutterMidnightNeonTheme._onSurfaceVariant,
      onPrimary: FlutterMidnightNeonTheme._onPrimaryColor,
      onSecondary: FlutterMidnightNeonTheme._onSecondaryColor,
      primaryContainer: FlutterMidnightNeonTheme._primaryContainer,
      error: FlutterMidnightNeonTheme._errorColor,
      onError: FlutterMidnightNeonTheme._onErrorColor,
    ),
  );
}