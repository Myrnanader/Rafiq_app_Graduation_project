import '../../data/models/food_model.dart';

abstract class FoodsState {}

class FoodsInitial extends FoodsState {}

class FoodsLoading extends FoodsState {}

class FoodsLoaded extends FoodsState {
  final List<FoodModel> foods;
  FoodsLoaded(this.foods);
}

class FoodsError extends FoodsState {
  final String message;
  FoodsError(this.message);
}

/// CREATE
class FoodCreating extends FoodsState {}

class FoodCreated extends FoodsState {
  final FoodModel food;
  FoodCreated(this.food);
}

class FoodCreateError extends FoodsState {
  final String message;
  FoodCreateError(this.message);
}
