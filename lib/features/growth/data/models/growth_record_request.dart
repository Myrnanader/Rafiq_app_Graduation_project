import 'package:json_annotation/json_annotation.dart';

part 'growth_record_request.g.dart';

@JsonSerializable()
class GrowthRecordRequest {
  final String childId;
  final double weightKg;
  final double heightCm;
  final DateTime measurementDate;

  GrowthRecordRequest({
    required this.childId,
    required this.weightKg,
    required this.heightCm,
    required this.measurementDate,
  });

  factory GrowthRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$GrowthRecordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthRecordRequestToJson(this);
}