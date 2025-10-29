import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

/// Environment configuration helper class
/// Loads Firebase configuration from environment variables
class EnvConfig {
  /// Get environment variable value with optional fallback
  static String getEnv(String key, {String fallback = ''}) {
    return dotenv.env[key] ?? fallback;
  }

  /// Get required environment variable (throws if missing)
  static String getRequiredEnv(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw Exception('Required environment variable $key is missing');
    }
    return value;
  }

  /// Check if running in debug mode
  static bool get isDebug => kDebugMode;
}

