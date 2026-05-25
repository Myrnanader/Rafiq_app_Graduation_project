import 'package:json_annotation/json_annotation.dart';

part 'food_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class FoodResponse<T> {

  final String status;
  final String? message;
  final T data;

  FoodResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory FoodResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$FoodResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
      Object? Function(T value) toJsonT,
      ) =>
      _$FoodResponseToJson(this, toJsonT);
}
