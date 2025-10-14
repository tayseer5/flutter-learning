import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color lightTitleText = Color(0xFF1E293B);
  static const Color lightSubtitleText = Color(0xFF64748B);
  static const Color lightBackground = Color.fromARGB(255, 194, 216, 238);
  
  // Dark Theme Colors
  static const Color darkTitleText = Color(0xFFF1F5F9);
  static const Color darkSubtitleText = Color(0xFF94A3B8);
  static const Color darkBackground = Color(0xFF0F172A);

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(198, 151, 120, 204)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 225, 200, 233),
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
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    scaffoldBackgroundColor: const Color.fromARGB(255, 110, 71, 111),
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
  );
}