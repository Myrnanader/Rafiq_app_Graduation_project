// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  id: json['id'] as String,
  content: json['content'] as String,
  likeCount: (json['likeCount'] as num).toInt(),
  isLikedByMe: json['isLikedByMe'] as bool,
  createdAt: json['createdAt'] as String,
  timeAgo: json['timeAgo'] as String,
  authorName: json['authorName'] as String?,
  authorImageUrl: json['authorImageUrl'] as String?,
  replies: (json['replies'] as List<dynamic>?)
      ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  motherProfileId: json['motherProfileId'] as String?,
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'likeCount': instance.likeCount,
      'isLikedByMe': instance.isLikedByMe,
      'authorName': instance.authorName,
      'authorImageUrl': instance.authorImageUrl,
      'createdAt': instance.createdAt,
      'timeAgo': instance.timeAgo,
      'replies': instance.replies,
      'motherProfileId': instance.motherProfileId,
    };
