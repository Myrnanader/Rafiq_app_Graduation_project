import 'package:shared_preferences/shared_preferences.dart';
import '../network/app_logger.dart';

class SharedPrefsService {
  static SharedPreferences? _prefs;

  /// Init
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    AppLogger.logger.i("SharedPreferences Initialized");
  }

  /// Save String
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
    AppLogger.logger.i("Saved String: $key");
  }

  /// Get String
  static String? getString(String key) {
    final value = _prefs?.getString(key);
    AppLogger.logger.i("Fetched String: $key = $value");
    return value;
  }

  /// Save Bool
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
    AppLogger.logger.i("Saved Bool: $key");
  }

  /// Get Bool
  static bool getBool(String key) {
    final value = _prefs?.getBool(key) ?? false;
    AppLogger.logger.i("Fetched Bool: $key = $value");
    return value;
  }

  /// Remove Key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
    AppLogger.logger.i("Removed Key: $key");
  }

  /// Clear All
  static Future<void> clear() async {
    await _prefs?.clear();
    AppLogger.logger.i("Cleared All SharedPreferences");
  }
}