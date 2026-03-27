// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryAnalysisResult _$CryAnalysisResultFromJson(Map<String, dynamic> json) =>
    CryAnalysisResult(
      primaryEmotion: json['primaryEmotion'] as String?,
      primaryConfidence: (json['primaryConfidence'] as num?)?.toDouble(),
      secondaryEmotion: json['secondaryEmotion'] as String?,
      secondaryConfidence: (json['secondaryConfidence'] as num?)?.toDouble(),
      message: json['message'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$CryAnalysisResultToJson(CryAnalysisResult instance) =>
    <String, dynamic>{
      'primaryEmotion': instance.primaryEmotion,
      'primaryConfidence': instance.primaryConfidence,
      'secondaryEmotion': instance.secondaryEmotion,
      'secondaryConfidence': instance.secondaryConfidence,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
    };
