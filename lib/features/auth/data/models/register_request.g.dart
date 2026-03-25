// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      role: json['role'] as String,
      profileType: json['profileType'] as String,
      pregnancyWeek: (json['currentPregnancyWeek'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'dateOfBirth': instance.dateOfBirth,
      'role': instance.role,
      'profileType': instance.profileType,
      'currentPregnancyWeek': instance.pregnancyWeek,
    };
