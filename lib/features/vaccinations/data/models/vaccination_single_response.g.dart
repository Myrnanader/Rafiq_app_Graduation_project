// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_single_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationSingleResponse _$VaccinationSingleResponseFromJson(
  Map<String, dynamic> json,
) => VaccinationSingleResponse(
  status: json['status'] as String,
  message: json['message'] as String?,
  data: VaccinationModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VaccinationSingleResponseToJson(
  VaccinationSingleResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
