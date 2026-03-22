import 'package:dio/dio.dart';
import '../../storage/secure_storage_service.dart';
import '../dio_factory.dart';

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
          return handler.next(err);
        }

        final dio = DioFactory.createDio();

        final response = await dio.post(
          "Auth/refresh-token",
          data: {
            "accessToken": accessToken,
            "refreshToken": refreshToken,
          },
        );

        final newAccessToken = response.data["token"];
        final newRefreshToken = response.data["refreshToken"];

        await secureStorage.saveTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        /// Retry original request
        final options = err.requestOptions;

        options.headers["Authorization"] = "Bearer $newAccessToken";

        final cloneReq = await dio.fetch(options);

        return handler.resolve(cloneReq);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }
}