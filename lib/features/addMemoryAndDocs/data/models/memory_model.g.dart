// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryModel _$MemoryModelFromJson(Map<String, dynamic> json) => MemoryModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  date: json['date'] as String?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$MemoryModelToJson(MemoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'imageUrl': instance.imageUrl,
    };
