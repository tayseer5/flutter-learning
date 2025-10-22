import 'package:flutter/material.dart';
import 'package:flutter_demo/helpers/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());

class ThemeNotifier extends Notifier<ThemeMode> {
  class ThemeNotifier extends Notifier<ThemeMode> {
    @override
    ThemeMode build() {
      // Return a default theme and load the saved preference asynchronously.
      // The state will be updated once loading is complete.
      _loadTheme();
      return ThemeMode.system; 
    }

    Future<void> _loadTheme() async {
      try {
        final prefs = await SharedPreferences.getInstance();
        // Use a default of null to detect if a preference has been set.
        final isDark = prefs.getBool(SharedPreferencesKeys.themeMode);
      
        if (isDark != null) {
          state = isDark ? ThemeMode.dark : ThemeMode.light;
        }
        // If isDark is null, we do nothing and let the state remain ThemeMode.system.
      } catch (e) {
        // Handle potential errors when accessing shared preferences.
        debugPrint('Failed to load theme preference: $e');
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
