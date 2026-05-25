import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/food_repository.dart';
import 'food_state.dart';

class FoodsCubit extends Cubit<FoodsState> {
  final FoodsRepository repo;

  FoodsCubit(this.repo) : super(FoodsInitial());

  Future<void> getFoods() async {
    emit(FoodsLoading());
    try {
      final data = await repo.getFoods();
      emit(FoodsLoaded(data));
    } catch (e) {
      emit(FoodsError(e.toString()));
    }
  }

  Future<void> getByCategory(String category) async {
    emit(FoodsLoading());
    try {
      final data = await repo.getFoodsByCategory(category);
      emit(FoodsLoaded(data));
    } catch (e) {
      emit(FoodsError(e.toString()));
    }
  }

  /// CREATE FOOD
  Future<void> createFood({
    required String name,
    required String description,
    String? imageUrl,
    required int category,
  }) async {
    emit(FoodCreating());

    try {
      final food = await repo.createFood(
        name: name,
        description: description,
        imageUrl: imageUrl,
        category: category,
      );

      emit(FoodCreated(food));

    } catch (e) {
      emit(FoodCreateError(e.toString()));
    }
  }

  Future<void> deleteFood(String id, String category) async {
    emit(FoodsLoading());

    try {
      await repo.deleteFood(id);

      final foods = await repo.getFoodsByCategory(category);

      emit(FoodsLoaded(foods));

      await getByCategory(category);

    } catch (e) {
      emit(FoodsError(e.toString()));
    }
  }

}
