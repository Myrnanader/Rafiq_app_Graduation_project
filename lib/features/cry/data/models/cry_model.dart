import 'package:json_annotation/json_annotation.dart';

part 'cry_model.g.dart';

@JsonSerializable()
class CryAnalysisResult {
  final String status;
  final String reason;
  final CryMetadata? metadata;
  final String recordingId;

  const CryAnalysisResult({
    required this.status,
    required this.reason,
    required this.recordingId,
    this.metadata,
  });

  factory CryAnalysisResult.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CryAnalysisResultFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CryAnalysisResultToJson(this);

  factory CryAnalysisResult.fromDynamic(
    dynamic data,
  ) {
    if (data is Map<String, dynamic>) {
      return CryAnalysisResult.fromJson(data);
    }

    return const CryAnalysisResult(
      status: 'Failed',
      reason: 'Invalid response',
      recordingId: '',
    );
  }
}

@JsonSerializable()
class CryMetadata {
  final String? fileName;
  final String? contentType;
  final int? fileSizeBytes;

  const CryMetadata({
    this.fileName,
    this.contentType,
    this.fileSizeBytes,
  });

  factory CryMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CryMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CryMetadataToJson(this);
}