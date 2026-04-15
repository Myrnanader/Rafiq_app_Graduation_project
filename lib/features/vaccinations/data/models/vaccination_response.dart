import 'package:json_annotation/json_annotation.dart';
import 'vaccination_model.dart';

part 'vaccination_response.g.dart';

@JsonSerializable()
class VaccinationResponse {
  final String status;
  final List<VaccinationModel> data;

  VaccinationResponse({
    required this.status,
    required this.data,
  });

  factory VaccinationResponse.fromJson(Map<String, dynamic> json) =>
      _$VaccinationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationResponseToJson(this);
}