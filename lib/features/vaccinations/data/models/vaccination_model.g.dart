// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationModel _$VaccinationModelFromJson(Map<String, dynamic> json) =>
    VaccinationModel(
      id: json['id'] as String,
      childId: json['childId'] as String,
      vaccineName: json['vaccineName'] as String,
      ageGroup: json['ageGroup'] as String,
      dueDate: json['dueDate'] as String,
      scheduledDate: json['scheduledDate'] as String?,
      takenDate: json['takenDate'] as String?,
      isTaken: json['isTaken'] as bool,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$VaccinationModelToJson(VaccinationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'vaccineName': instance.vaccineName,
      'ageGroup': instance.ageGroup,
      'dueDate': instance.dueDate,
      'scheduledDate': instance.scheduledDate,
      'takenDate': instance.takenDate,
      'isTaken': instance.isTaken,
      'notes': instance.notes,
    };
