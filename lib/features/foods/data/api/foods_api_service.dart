import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/basic_response.dart';
import '../models/food_model.dart';
import '../models/food_response.dart';

part 'foods_api_service.g.dart';

@RestApi()
abstract class FoodsApiService {
  factory FoodsApiService(Dio dio, {String baseUrl}) = _FoodsApiService;

  /// GET ALL FOODS
  @GET("foods")
  Future<FoodResponse<List<FoodModel>>> getFoods();

  @GET("foods/category/{category}")
  Future<FoodResponse<List<FoodModel>>> getFoodsByCategory(
    @Path("category") String category,
  );

  /// CREATE FOOD (ADMIN ONLY)
  @POST("foods")
  Future<FoodResponse<FoodModel>> createFood(@Body() Map<String, dynamic> body);

  /// DELETE FOOD (ADMIN ONLY)
  @DELETE("foods/{id}")
  Future<BasicResponse> deleteFood(@Path("id") String id);
}
