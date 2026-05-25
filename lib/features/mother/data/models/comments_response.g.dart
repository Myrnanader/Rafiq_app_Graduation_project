// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) =>
    CommentsResponse(
      status: json['status'] as String,
      page: (json['page'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentsResponseToJson(CommentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'page': instance.page,
      'size': instance.size,
      'data': instance.data,
    };
