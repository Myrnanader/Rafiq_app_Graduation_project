import 'package:json_annotation/json_annotation.dart';

part 'memory_model.g.dart';

@JsonSerializable()
class MemoryModel {
  final String id;
  final String title;
  final String? description;
  final String? date;
  final String? imageUrl;

  MemoryModel({
    required this.id,
    required this.title,
    this.description,
    this.date,
    this.imageUrl,
  });

  factory MemoryModel.fromJson(Map<String, dynamic> json) =>
      _$MemoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemoryModelToJson(this);

  String? get fullImageUrl {
    if (imageUrl == null || imageUrl!.isEmpty) return null;

    if (imageUrl!.startsWith("http")) return imageUrl;

    final cleanPath = imageUrl!.startsWith("/")
        ? imageUrl!.substring(1)
        : imageUrl;

    return "https://rafiq.runasp.net/$cleanPath";
  }

}
