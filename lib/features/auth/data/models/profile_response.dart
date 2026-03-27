import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final ProfileData? data;

  ProfileResponse({this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  ///  helper getters (مهمين جدًا)
  String? get fullName => data?.user?.name;

  int? get pregnancyWeek => data?.motherProfile?.currentPregnancyWeek;
}

@JsonSerializable()
class ProfileData {
  final User? user;

  @JsonKey(name: "motherProfile")
  final MotherProfile? motherProfile;

  ProfileData({this.user, this.motherProfile});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable()
class User {
  final String? name;

  User({this.name});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class MotherProfile {
  final int? currentPregnancyWeek;

  MotherProfile({this.currentPregnancyWeek});

  factory MotherProfile.fromJson(Map<String, dynamic> json) =>
      _$MotherProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MotherProfileToJson(this);
}