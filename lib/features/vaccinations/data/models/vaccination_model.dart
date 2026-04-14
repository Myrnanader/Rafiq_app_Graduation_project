import 'package:json_annotation/json_annotation.dart';

part 'vaccination_model.g.dart';

@JsonSerializable()
class VaccinationModel {
  final String id;
  final String childId;
  final String vaccineName;
  final String ageGroup;
  final String dueDate;
  final String? scheduledDate;
  final String? takenDate;
  final bool isTaken;
  final String? notes;

  VaccinationModel({
    required this.id,
    required this.childId,
    required this.vaccineName,
    required this.ageGroup,
    required this.dueDate,
    this.scheduledDate,
    this.takenDate,
    required this.isTaken,
    this.notes,
  });

  factory VaccinationModel.fromJson(Map<String, dynamic> json) =>
      _$VaccinationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationModelToJson(this);
}