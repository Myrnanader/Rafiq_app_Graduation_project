import 'package:dio/dio.dart';
import 'package:rafiq_app/core/errors/api_error_handler.dart';
import 'package:rafiq_app/core/errors/error_model.dart';
import 'package:rafiq_app/features/growth/data/api/children_api_service.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';

class ChildrenRepository {
  final ChildrenApiService api;

  ChildrenRepository(this.api);

  Future<List<ChildResponse>> getChildren() async {
    try {
      final response = await api.getChildren();

      /// لو حابب تتحقق من status
      if (response.status != "Success") {
        throw ErrorModel(message: "Failed to fetch children");
      }

      return response.data;
    } on DioException catch (error) {
      throw ApiErrorHandler.handle(error);
    }
  }
}