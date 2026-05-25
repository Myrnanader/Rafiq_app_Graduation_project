import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String id;
  final String? motherProfileId;
  final String? authorName;
  final String? authorImageUrl;
  final String? createdAt;
  final String? titleOrChallenge;
  final String? contentOrSolution;
  final String? imageUrl;
  final int likeCount;
  final int? commentCount;
  final bool isLikedByMe;
  final bool isSavedByMe;
  final int? type;

  PostModel({
    required this.id,
    this.motherProfileId,
    this.authorName,
    this.authorImageUrl,
    this.createdAt,
    this.titleOrChallenge,
    this.contentOrSolution,
    this.imageUrl,
    required this.likeCount,
    this.commentCount,
    required this.isLikedByMe,
    required this.isSavedByMe,
    this.type,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  String? get fullImageUrl {
    if (imageUrl == null || imageUrl!.isEmpty) return null;
    if (imageUrl!.startsWith("http")) return imageUrl;
    return "https://rafiq.runasp.net/$imageUrl";
  }
  PostModel copyWith({
    String? id,
    String? motherProfileId,
    String? authorName,
    String? authorImageUrl,
    String? createdAt,
    String? titleOrChallenge,
    String? contentOrSolution,
    String? imageUrl,
    int? likeCount,
    int? commentCount,
    bool? isLikedByMe,
    bool? isSavedByMe,
    int? type,
  }) {
    return PostModel(
      id: id ?? this.id,
      motherProfileId: motherProfileId ?? this.motherProfileId,
      authorName: authorName ?? this.authorName,
      authorImageUrl: authorImageUrl ?? this.authorImageUrl,
      createdAt: createdAt ?? this.createdAt,
      titleOrChallenge: titleOrChallenge ?? this.titleOrChallenge,
      contentOrSolution: contentOrSolution ?? this.contentOrSolution,
      imageUrl: imageUrl ?? this.imageUrl,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      isLikedByMe: isLikedByMe ?? this.isLikedByMe,
      isSavedByMe: isSavedByMe ?? this.isSavedByMe,
      type: type ?? this.type,
    );
  }

}
