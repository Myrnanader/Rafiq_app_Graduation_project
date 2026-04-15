// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationResponse _$VaccinationResponseFromJson(Map<String, dynamic> json) =>
    VaccinationResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VaccinationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VaccinationResponseToJson(
  VaccinationResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
