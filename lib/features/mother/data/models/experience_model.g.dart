// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    ExperienceModel(
      id: json['id'] as String,
      userName: json['userName'] as String?,
      userImage: json['userImage'] as String?,
      challenge: json['challenge'] as String?,
      solution: json['solution'] as String?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      isSaved: json['isSaved'] as bool?,
      createdAt: json['createdAt'] as String?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'challenge': instance.challenge,
      'solution': instance.solution,
      'likesCount': instance.likesCount,
      'isLiked': instance.isLiked,
      'isSaved': instance.isSaved,
      'createdAt': instance.createdAt,
      'commentsCount': instance.commentsCount,
    };
