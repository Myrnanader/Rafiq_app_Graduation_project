import 'package:shared_preferences/shared_preferences.dart';
import '../network/app_logger.dart';

class SharedPrefsService {
  static SharedPreferences? _prefs;

  static const String _isFirstTimeKey = "is_first_time";
  static const String _isLoggedInKey = "is_logged_in";
  static const String _fullNameKey = "full_name";
  static const String _pregnancyWeekKey = "pregnancy_week";

  // ─── Init ─────────────────────────────────────────────────

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    AppLogger.logger.i("SharedPreferences Initialized");
  }

  // ─── Onboarding ───────────────────────────────────────────

  static bool isFirstTime() {
    return _prefs?.getBool(_isFirstTimeKey) ?? true;
  }

  static Future<void> setFirstTimeDone() async {
    await _prefs?.setBool(_isFirstTimeKey, false);
  }

  // ─── Login State ──────────────────────────────────────────

  static bool isLoggedIn() {
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    await _prefs?.setBool(_isLoggedInKey, value);
  }

  // ─── User Data ────────────────────────────────────────────
  // يتحفظ من register flow فقط

  static Future<void> saveUserData({
    required String fullName,
    int? pregnancyWeek,
  }) async {
    if (_prefs == null) return;

    final trimmedName = fullName.trim();

    ///  متخزنش اسم فاضي
    if (trimmedName.isEmpty) {
      AppLogger.logger.w("Skipped saving empty fullName");
      return;
    }

    ///  خزّن الاسم
    await _prefs!.setString(_fullNameKey, trimmedName);

    ///  خزّن الـ week لو valid فقط
    if (pregnancyWeek != null && pregnancyWeek > 0) {
      await _prefs!.setInt(_pregnancyWeekKey, pregnancyWeek);
    }

    AppLogger.logger.i(
      "Saved user data: $trimmedName, week: $pregnancyWeek",
    );
  }

  static String? getFullName() {
    if (_prefs == null) return null;

    final name = _prefs!.getString(_fullNameKey);

    ///  لو فاضي رجّع null بدل ""
    if (name == null || name.trim().isEmpty) {
      return null;
    }

    return name.trim();
  }

  static int? getPregnancyWeek() {
    return _prefs?.getInt(_pregnancyWeekKey);
  }

  // ─── Generic ──────────────────────────────────────────────

  static Future<void> setString(String key, String value) async {
    if (_prefs == null) return;
    await _prefs!.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<void> setBool(String key, bool value) async {
    if (_prefs == null) return;
    await _prefs!.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  static Future<void> remove(String key) async {
    if (_prefs == null) return;
    await _prefs!.remove(key);
  }

  ///  clear user data فقط (لو احتجتها)
  static Future<void> clearUserData() async {
    if (_prefs == null) return;

    await _prefs!.remove(_fullNameKey);
    await _prefs!.remove(_pregnancyWeekKey);

    AppLogger.logger.i("User data cleared");
  }

  /// Full clear (يفضل متستخدمهاش في logout)
  static Future<void> clear() async {
    if (_prefs == null) return;
    await _prefs!.clear();
    AppLogger.logger.i("All SharedPreferences cleared");
  }
}