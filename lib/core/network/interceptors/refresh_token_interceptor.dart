import 'package:dio/dio.dart';
import '../../storage/secure_storage_service.dart';

class RefreshTokenInterceptor extends Interceptor {
  final SecureStorageService secureStorage;

  RefreshTokenInterceptor(this.secureStorage);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final accessToken = await secureStorage.getAccessToken();
        final refreshToken = await secureStorage.getRefreshToken();

        if (accessToken == null || refreshToken == null) {
          await secureStorage.clearTokens();
          return handler.next(err);
        }

        /// ✅ FIX: Dio منفصل وبسيط - بدون interceptors عشان منتعملش loop
        final refreshDio = Dio(
          BaseOptions(
            baseUrl: "http://rafiq.runasp.net/api/",
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          ),
        );

        final response = await refreshDio.post(
          "Auth/refresh-token",
          data: {
            "accessToken": accessToken,
            "refreshToken": refreshToken,
          },
        );

        final newAccessToken = response.data["token"];
        final newRefreshToken = response.data["refreshToken"];

        /// ✅ FIX: تأكد إن التوكنز مش null أو فاضيين قبل الحفظ
        if (newAccessToken == null ||
            newAccessToken.toString().isEmpty ||
            newRefreshToken == null ||
            newRefreshToken.toString().isEmpty) {
          await secureStorage.clearTokens();
          return handler.next(err);
        }

        await secureStorage.saveTokens(
          accessToken: newAccessToken.toString(),
          refreshToken: newRefreshToken.toString(),
        );

        /// Retry original request بالتوكن الجديد
        final options = err.requestOptions;
        options.headers["Authorization"] = "Bearer $newAccessToken";

        /// ✅ استخدم refreshDio مش الـ Dio الأصلي عشان منعملش loop
        final cloneReq = await refreshDio.fetch(options);

        return handler.resolve(cloneReq);
      } catch (e) {
        /// لو الـ refresh فشل - امسح التوكنز وارجع الـ error الأصلي
        await secureStorage.clearTokens();
        return handler.next(err);
      }
    }

    return handler.next(err);
  }
}