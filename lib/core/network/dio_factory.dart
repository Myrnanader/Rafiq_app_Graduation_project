import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../storage/secure_storage_service.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/refresh_token_interceptor.dart';
import 'app_logger.dart';
import 'interceptors/logging_interceptor.dart';

class DioFactory {
  static Dio createDio() {
    final secureStorage = SecureStorageService();

    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: "http://rafiq.runasp.net/api/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    /// Interceptors
    dio.interceptors.addAll([
      AuthInterceptor(secureStorage),
      RefreshTokenInterceptor(secureStorage),

      LoggingInterceptor(AppLogger.logger),

      PrettyDioLogger(requestBody: true, responseBody: true),
    ]);

    return dio;
  }
}
