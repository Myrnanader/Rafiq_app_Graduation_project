import '../api/foods_api_service.dart';
import '../models/food_model.dart';

class FoodsRepository {
  final FoodsApiService api;

  FoodsRepository(this.api);

  Future<List<FoodModel>> getFoods() async {
    final response = await api.getFoods();
    return response.data;
  }

  Future<List<FoodModel>> getFoodsByCategory(String category) async {
    final response = await api.getFoodsByCategory(category);
    return response.data;
  }

  /// CREATE FOOD (ADMIN)
  Future<FoodModel> createFood({
    required String name,
    String? description,
    String? imageUrl,
    required int category,
  }) async {
    final response = await api.createFood({
      "name": name,
      "description": description,
      "imageUrl": imageUrl,
      "category": category,
    });

    return response.data;
  }

  /// DELETE FOOD (ADMIN)
  Future<void> deleteFood(String id) async {
    await api.deleteFood(id);
  }
}
