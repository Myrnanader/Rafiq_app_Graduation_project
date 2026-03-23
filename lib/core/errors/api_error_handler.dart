import 'package:dio/dio.dart';
import 'error_model.dart';

class ApiErrorHandler {
  static ErrorModel handle(dynamic error) {
    /// ✅ لو هو ErrorModel أصلاً (من isSuccess check في Repository)
    if (error is ErrorModel) return error;

    if (error is! DioException) {
      return ErrorModel(message: "Unexpected error occurred");
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorModel(message: "Connection timeout. Check your internet.");

      case DioExceptionType.sendTimeout:
        return ErrorModel(message: "Request timed out. Try again.");

      case DioExceptionType.receiveTimeout:
        return ErrorModel(message: "Server is taking too long. Try again.");

      case DioExceptionType.badResponse:
        return _handleResponse(error.response);

      case DioExceptionType.cancel:
        return ErrorModel(message: "Request cancelled.");

      case DioExceptionType.connectionError:
        return ErrorModel(message: "No internet connection.");

      default:
        return ErrorModel(message: "Unexpected error occurred.");
    }
  }

  static ErrorModel _handleResponse(Response? response) {
    if (response?.data == null) {
      return ErrorModel(message: "Server error (${response?.statusCode})");
    }

    final data = response!.data;

    if (data is Map) {
      /// Format 1: { "isSuccess": false, "message": "..." }
      if (data["message"] != null && data["message"].toString().isNotEmpty) {
        return ErrorModel(message: data["message"]);
      }

      /// Format 2: { "status": "Error", "message": "..." }
      if (data["status"] != null) {
        final msg = data["message"] ?? data["status"];
        return ErrorModel(message: msg.toString());
      }

      /// Format 3: { "title": "...", "errors": {...} }  (ASP.NET validation)
      if (data["errors"] != null) {
        final errors = data["errors"];
        if (errors is Map && errors.isNotEmpty) {
          final firstKey = errors.keys.first;
          final firstError = errors[firstKey];
          if (firstError is List && firstError.isNotEmpty) {
            return ErrorModel(message: firstError.first.toString());
          }
        }
        return ErrorModel(message: data["title"] ?? "Validation error");
      }
    }

    return ErrorModel(message: "Unknown error (${response.statusCode})");
  }
}