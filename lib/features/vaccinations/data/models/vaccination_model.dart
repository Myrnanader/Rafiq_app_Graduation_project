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
  VaccinationModel copyWith({
  String? id,
  String? childId,
  String? vaccineName,
  String? ageGroup,
  String? dueDate,
  String? scheduledDate,
  String? takenDate,
  bool? isTaken,
  String? notes,
}) {
  return VaccinationModel(
    id: id ?? this.id,
    childId: childId ?? this.childId,
    vaccineName: vaccineName ?? this.vaccineName,
    ageGroup: ageGroup ?? this.ageGroup,
    dueDate: dueDate ?? this.dueDate,
    scheduledDate: scheduledDate ?? this.scheduledDate,
    takenDate: takenDate ?? this.takenDate,
    isTaken: isTaken ?? this.isTaken,
    notes: notes ?? this.notes,
  );
}

  factory VaccinationModel.fromJson(Map<String, dynamic> json) =>
      _$VaccinationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationModelToJson(this);
}