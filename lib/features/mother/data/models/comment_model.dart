import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  final String id;
  final String content;

  final int likeCount;
  final bool isLikedByMe;

  final String? authorName;
  final String? authorImageUrl;

  final String createdAt;
  final String timeAgo;

  final List<CommentModel>? replies;

  final String? motherProfileId;

  CommentModel({
    required this.id,
    required this.content,
    required this.likeCount,
    required this.isLikedByMe,
    required this.createdAt,
    required this.timeAgo,
    this.authorName,
    this.authorImageUrl,
    this.replies,
    this.motherProfileId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  CommentModel copyWith({
    int? likeCount,
    bool? isLikedByMe,
  }) {
    return CommentModel(
      id: id,
      content: content,
      likeCount: likeCount ?? this.likeCount,
      isLikedByMe: isLikedByMe ?? this.isLikedByMe,
      authorName: authorName,
      authorImageUrl: authorImageUrl,
      createdAt: createdAt,
      timeAgo: timeAgo,
      replies: replies,
    );
  }

}
