import 'package:json_annotation/json_annotation.dart';

part 'experience_model.g.dart';

@JsonSerializable()
class ExperienceModel {
  final String id;
  final String? userName;
  final String? userImage;
  final String? challenge;
  final String? solution;
  final int? likesCount;
  final bool? isLiked;
  final bool? isSaved;
  final String? createdAt;
  final int? commentsCount;

  ExperienceModel({
    required this.id,
    this.userName,
    this.userImage,
    this.challenge,
    this.solution,
    this.likesCount,
    this.isLiked,
    this.isSaved,
    this.createdAt,
    this.commentsCount,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
  String? get fullImageUrl {
    if (userImage == null || userImage!.isEmpty) return null;
    if (userImage!.startsWith("http")) return userImage;
    return "https://rafiq.runasp.net/$userImage";
  }
}
