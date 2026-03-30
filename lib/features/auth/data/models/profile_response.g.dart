// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{'data': instance.data};

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  motherProfile: json['motherProfile'] == null
      ? null
      : MotherProfile.fromJson(json['motherProfile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'motherProfile': instance.motherProfile,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  name: json['name'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
  'dateOfBirth': instance.dateOfBirth,
};

MotherProfile _$MotherProfileFromJson(Map<String, dynamic> json) =>
    MotherProfile(
      currentPregnancyWeek: (json['currentPregnancyWeek'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MotherProfileToJson(MotherProfile instance) =>
    <String, dynamic>{'currentPregnancyWeek': instance.currentPregnancyWeek};
