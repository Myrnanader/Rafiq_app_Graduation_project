import 'package:dio/dio.dart';
import 'error_model.dart';

class ApiErrorHandler {
  static ErrorModel handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorModel(message: "Connection timeout");

      case DioExceptionType.sendTimeout:
        return ErrorModel(message: "Send timeout");

      case DioExceptionType.receiveTimeout:
        return ErrorModel(message: "Receive timeout");

      case DioExceptionType.badResponse:
        return _handleResponse(error.response);

      case DioExceptionType.cancel:
        return ErrorModel(message: "Request cancelled");

      default:
        return ErrorModel(message: "Unexpected error occurred");
    }
  }

  static ErrorModel _handleResponse(Response? response) {
    if (response?.data != null) {
      final data = response!.data;

      if (data["message"] != null) {
        return ErrorModel(message: data["message"]);
      }

      if (data["status"] != null) {
        return ErrorModel(message: data["status"]);
      }
    }

    return ErrorModel(message: "Unknown error");
  }
}