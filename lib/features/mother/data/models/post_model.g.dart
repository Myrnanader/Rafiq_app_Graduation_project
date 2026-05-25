// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
  id: json['id'] as String,
  motherProfileId: json['motherProfileId'] as String?,
  authorName: json['authorName'] as String?,
  authorImageUrl: json['authorImageUrl'] as String?,
  createdAt: json['createdAt'] as String?,
  titleOrChallenge: json['titleOrChallenge'] as String?,
  contentOrSolution: json['contentOrSolution'] as String?,
  imageUrl: json['imageUrl'] as String?,
  likeCount: (json['likeCount'] as num).toInt(),
  commentCount: (json['commentCount'] as num?)?.toInt(),
  isLikedByMe: json['isLikedByMe'] as bool,
  isSavedByMe: json['isSavedByMe'] as bool,
  type: (json['type'] as num?)?.toInt(),
);

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
  'id': instance.id,
  'motherProfileId': instance.motherProfileId,
  'authorName': instance.authorName,
  'authorImageUrl': instance.authorImageUrl,
  'createdAt': instance.createdAt,
  'titleOrChallenge': instance.titleOrChallenge,
  'contentOrSolution': instance.contentOrSolution,
  'imageUrl': instance.imageUrl,
  'likeCount': instance.likeCount,
  'commentCount': instance.commentCount,
  'isLikedByMe': instance.isLikedByMe,
  'isSavedByMe': instance.isSavedByMe,
  'type': instance.type,
};
