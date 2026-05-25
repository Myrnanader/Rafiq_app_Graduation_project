import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final String id;
  final String title;
  final String shortSummary;
  final String fullDescription;
  final int targetTrimester;
  final String? imageUrl;

  ExerciseModel({
    required this.id,
    required this.title,
    required this.shortSummary,
    required this.fullDescription,
    required this.targetTrimester,
    this.imageUrl,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  String? get fullImageUrl {
    if (imageUrl == null || imageUrl!.isEmpty) return null;
    if (imageUrl!.startsWith("http")) return imageUrl;
    return "https://rafiq.runasp.net/$imageUrl";
  }
}
