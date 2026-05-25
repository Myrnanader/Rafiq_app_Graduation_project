// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoriesResponse _$MemoriesResponseFromJson(Map<String, dynamic> json) =>
    MemoriesResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MemoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemoriesResponseToJson(MemoriesResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
