import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/delivery_prediction_request.dart';
import '../models/delivery_prediction_response.dart';

part 'delivery_prediction_api_service.g.dart';

@RestApi()
abstract class DeliveryPredictionApiService {
  factory DeliveryPredictionApiService(Dio dio, {String baseUrl}) =
  _DeliveryPredictionApiService;

  @POST('predict-delivery')
  Future<DeliveryPredictionResponse> predictDelivery(
      @Body() DeliveryPredictionRequest request,
      );
}