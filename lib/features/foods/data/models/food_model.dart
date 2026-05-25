import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final int category;

  FoodModel({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.category,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);

  String? get fullImageUrl {
    if (imageUrl == null || imageUrl!.isEmpty) return null;
    if (imageUrl!.startsWith("http")) return imageUrl;
    return "https://rafiq.runasp.net/$imageUrl";
  }
}
