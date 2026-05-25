// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperiencesResponse _$ExperiencesResponseFromJson(Map<String, dynamic> json) =>
    ExperiencesResponse(
      status: json['status'] as String,
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperiencesResponseToJson(
  ExperiencesResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'page': instance.page,
  'size': instance.size,
  'data': instance.data,
};
