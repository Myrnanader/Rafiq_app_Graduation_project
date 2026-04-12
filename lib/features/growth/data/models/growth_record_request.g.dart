// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowthRecordRequest _$GrowthRecordRequestFromJson(Map<String, dynamic> json) =>
    GrowthRecordRequest(
      childId: json['childId'] as String,
      weightKg: (json['weightKg'] as num).toDouble(),
      heightCm: (json['heightCm'] as num).toDouble(),
      measurementDate: DateTime.parse(json['measurementDate'] as String),
    );

Map<String, dynamic> _$GrowthRecordRequestToJson(
  GrowthRecordRequest instance,
) => <String, dynamic>{
  'childId': instance.childId,
  'weightKg': instance.weightKg,
  'heightCm': instance.heightCm,
  'measurementDate': instance.measurementDate.toIso8601String(),
};
