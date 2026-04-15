import 'package:json_annotation/json_annotation.dart';
import 'vaccination_model.dart';

part 'vaccination_single_response.g.dart';

@JsonSerializable()
class VaccinationSingleResponse {
  final String status;
  final String? message;
  final VaccinationModel data;

  VaccinationSingleResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory VaccinationSingleResponse.fromJson(Map<String, dynamic> json) =>
      _$VaccinationSingleResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VaccinationSingleResponseToJson(this);
}