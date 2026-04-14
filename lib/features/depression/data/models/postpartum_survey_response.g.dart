// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postpartum_survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostpartumSurveyResponse _$PostpartumSurveyResponseFromJson(
  Map<String, dynamic> json,
) => PostpartumSurveyResponse(
  status: json['status'] as String,
  totalScore: (json['totalScore'] as num?)?.toInt() ?? 0,
  riskLevel: json['riskLevel'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$PostpartumSurveyResponseToJson(
  PostpartumSurveyResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'totalScore': instance.totalScore,
  'riskLevel': instance.riskLevel,
  'message': instance.message,
};
