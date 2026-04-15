import 'package:dio/dio.dart';
import '../../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService secureStorage;

  AuthInterceptor(this.secureStorage);

  ///  endpoints اللي مش محتاجة token
  final List<String> _noAuthEndpoints = [
    "Auth/login",
    "Auth/register",
    "Auth/forget-password",
    "Auth/verify-otp",
    "Auth/verify-registration",
    "Auth/reset-password",
  ];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    ///  check لو endpoint مش محتاج auth
    final isNoAuthRequired = _noAuthEndpoints.any(
      (endpoint) => options.path.contains(endpoint),
    );

    if (isNoAuthRequired) {
      return handler.next(options);
    }

    ///  add token لو موجود
    final token = await secureStorage.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return handler.next(options);
  }
}