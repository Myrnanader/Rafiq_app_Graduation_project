// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowthRecordResponse _$GrowthRecordResponseFromJson(
  Map<String, dynamic> json,
) => GrowthRecordResponse(
  id: json['id'] as String,
  childId: json['childId'] as String,
  weightKg: (json['weightKg'] as num).toDouble(),
  heightCm: (json['heightCm'] as num).toDouble(),
  measurementDate: DateTime.parse(json['measurementDate'] as String),
);

Map<String, dynamic> _$GrowthRecordResponseToJson(
  GrowthRecordResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'childId': instance.childId,
  'weightKg': instance.weightKg,
  'heightCm': instance.heightCm,
  'measurementDate': instance.measurementDate.toIso8601String(),
};
