// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryAnalysisResult _$CryAnalysisResultFromJson(Map<String, dynamic> json) =>
    CryAnalysisResult(
      status: json['status'] as String,
      reason: json['reason'] as String,
      recordingId: json['recordingId'] as String,
      metadata: json['metadata'] == null
          ? null
          : CryMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryAnalysisResultToJson(CryAnalysisResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
      'metadata': instance.metadata,
      'recordingId': instance.recordingId,
    };

CryMetadata _$CryMetadataFromJson(Map<String, dynamic> json) => CryMetadata(
  fileName: json['fileName'] as String?,
  contentType: json['contentType'] as String?,
  fileSizeBytes: (json['fileSizeBytes'] as num?)?.toInt(),
);

Map<String, dynamic> _$CryMetadataToJson(CryMetadata instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'contentType': instance.contentType,
      'fileSizeBytes': instance.fileSizeBytes,
    };
