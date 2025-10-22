import 'package:flutter/material.dart';
import 'package:flutter_demo/helpers/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());

class ThemeNotifier extends Notifier<ThemeMode> {
  bool _hasLoaded = false;

  @override
  ThemeMode build() {
    if (!_hasLoaded) {
      _loadTheme();
    }
    return ThemeMode.system; // Default to system theme
  }

  Future<void> _loadTheme() async {
    if (_hasLoaded) return; // Prevent multiple loads
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(SharedPreferencesKeys.themeMode) ?? false;
      _hasLoaded = true;
      state = isDark ? ThemeMode.dark : ThemeMode.light;
    } catch (e) {
      // If loading fails, keep default system theme
      _hasLoaded = true;
    }
  }

  Future<void> toggleTheme(bool isDark) async {
    // Immediately update UI for better UX
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    
    // Save with retry mechanism in background
    final success = await _saveThemeWithRetry(isDark);
     if (!success) {
    // Revert UI state if save failed
    state = isDark ? ThemeMode.light : ThemeMode.dark;
    //faild to  update theme alert
  }
  }

  Future<bool> _saveThemeWithRetry(bool isDark, {int retries = 3}) async {
    for (int i = 0; i < retries; i++) {
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(SharedPreferencesKeys.themeMode, isDark);
        return true; // Success
      } catch (e) {
        if (i == retries - 1) {
          // Final attempt failed - log error
          debugPrint('Failed to save theme after $retries attempts: $e');
          return false;
        } else {
          // Wait before retry with exponential backoff
          await Future.delayed(Duration(milliseconds: 100 * (i + 1)));
        }
      }
    }
    return false; // Should never reach here, but required for null safety
  }
}