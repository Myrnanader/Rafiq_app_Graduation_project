import 'package:dio/dio.dart';

import '../api/delivery_prediction_api_service.dart';
import '../models/delivery_prediction_request.dart';
import '../models/delivery_prediction_response.dart';

class DeliveryPredictionRepository {
  DeliveryPredictionRepository({required this.apiService});

  final DeliveryPredictionApiService apiService;

  Future<DeliveryPredictionResponse> predictDelivery(
      List<double?> features,
      ) async {
    try {
      final request = DeliveryPredictionRequest.fromFeatures(features);
      return await apiService.predictDelivery(request);
    } on DioException catch (e) {
      throw Exception(_mapDioError(e));
    } catch (_) {
      throw Exception('please try again');
    }
  }

  String _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Timeout try again later';
      case DioExceptionType.connectionError:
        return 'Check your internet';
      case DioExceptionType.badResponse:
        return ' Failed request: ${e.response?.statusCode ?? ''}';
      default:
        return 'Something happened';
    }
  }
}