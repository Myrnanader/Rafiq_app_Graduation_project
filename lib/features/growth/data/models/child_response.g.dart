// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildResponse _$ChildResponseFromJson(Map<String, dynamic> json) =>
    ChildResponse(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$ChildResponseToJson(ChildResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'dateOfBirth': instance.dateOfBirth,
      'height': instance.height,
      'weight': instance.weight,
      'gender': instance.gender,
    };

ChildrenResponseWrapper _$ChildrenResponseWrapperFromJson(
  Map<String, dynamic> json,
) => ChildrenResponseWrapper(
  status: json['status'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => ChildResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ChildrenResponseWrapperToJson(
  ChildrenResponseWrapper instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
