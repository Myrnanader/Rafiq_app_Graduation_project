import 'package:json_annotation/json_annotation.dart';
import 'experience_model.dart';

part 'experience_response.g.dart';

@JsonSerializable()
class ExperiencesResponse {
  final String status;
  final int page;
  final int size;
  final List<ExperienceModel> data;

  ExperiencesResponse({
    required this.status,
    required this.page,
    required this.size,
    required this.data,
  });

  factory ExperiencesResponse.fromJson(Map<String, dynamic> json) =>
      _$ExperiencesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExperiencesResponseToJson(this);
}
