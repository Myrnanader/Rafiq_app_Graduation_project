import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger logger;

  LoggingInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("""
➡️ REQUEST
URL: ${options.uri}
METHOD: ${options.method}
HEADERS: ${options.headers}
BODY: ${options.data}
""");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i("""
✅ RESPONSE
URL: ${response.requestOptions.uri}
STATUS: ${response.statusCode}
DATA: ${response.data}
""");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e("""
❌ ERROR
URL: ${err.requestOptions.uri}
STATUS: ${err.response?.statusCode}
MESSAGE: ${err.message}
DATA: ${err.response?.data}
""");
    super.onError(err, handler);
  }
}