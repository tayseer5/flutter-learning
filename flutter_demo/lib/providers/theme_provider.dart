import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helpers/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
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
    
    // Then save to preferences (don't wait for this)
    _saveTheme(isDark);
  }

  Future<void> _saveTheme(bool isDark) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(SharedPreferencesKeys.themeMode, isDark);
    } catch (e) {
      // Handle save error silently or show user feedback
      debugPrint('Failed to save theme preference: $e');
    }
  }


}
