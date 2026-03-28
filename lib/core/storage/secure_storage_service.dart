import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ///  KEYS
  static const String _accessTokenKey = "access_token";
  static const String _refreshTokenKey = "refresh_token";
  static const String _emailKey = "user_email";

  /// ================= SAVE =================

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> saveEmail(String email) async {
    await _storage.write(key: _emailKey, value: email);
  }

  /// ================= GET =================

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _emailKey);
  }

  /// ================= CHECK =================

  Future<bool> hasValidToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<bool> hasUserEmail() async {
    final email = await getEmail();
    return email != null && email.isNotEmpty;
  }

  /// ================= DELETE =================

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<void> clearEmail() async {
    await _storage.delete(key: _emailKey);
  }

  ///  IMPORTANT (Logout / Delete Account)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}