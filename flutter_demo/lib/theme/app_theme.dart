import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors - Google Keep inspired
  static const Color lightTitleText = Color(0xFF202124);
  static const Color lightSubtitleText = Color(0xFF5F6368);
  static const Color lightBackground = Color(0xFFFEFEFE);
  
  // Dark Theme Colors - Google Keep dark mode
  static const Color darkTitleText = Color(0xFFE8EAED);
  static const Color darkSubtitleText = Color(0xFF9AA0A6);
  static const Color darkBackground = Color(0xFF202124);

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFDBF00), // Google Keep yellow
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: lightBackground,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: lightTitleText, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: lightTitleText, fontSize: 18, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(color: lightTitleText, fontSize: 16, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: lightTitleText, fontSize: 16),
      bodyMedium: TextStyle(color: lightSubtitleText, fontSize: 14),
      bodySmall: TextStyle(color: lightSubtitleText, fontSize: 12),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(color: lightTitleText, fontSize: 16, fontWeight: FontWeight.w500),
      subtitleTextStyle: TextStyle(color: lightSubtitleText, fontSize: 14),
    ),
    cardTheme: CardThemeData(
      color: lightBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFDBF00), // Google Keep yellow
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: darkBackground,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: darkTitleText, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: darkTitleText, fontSize: 18, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(color: darkTitleText, fontSize: 16, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: darkTitleText, fontSize: 16),
      bodyMedium: TextStyle(color: darkSubtitleText, fontSize: 14),
      bodySmall: TextStyle(color: darkSubtitleText, fontSize: 12),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(color: darkTitleText, fontSize: 16, fontWeight: FontWeight.w500),
      subtitleTextStyle: TextStyle(color: darkSubtitleText, fontSize: 14),
    ),
    cardTheme: CardThemeData(
      color: darkBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}