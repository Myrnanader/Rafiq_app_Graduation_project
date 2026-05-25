// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      shortSummary: json['shortSummary'] as String,
      fullDescription: json['fullDescription'] as String,
      targetTrimester: (json['targetTrimester'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'shortSummary': instance.shortSummary,
      'fullDescription': instance.fullDescription,
      'targetTrimester': instance.targetTrimester,
      'imageUrl': instance.imageUrl,
    };
