class AuthRegisterData {
  String? fullName;
  String? email;
  String? password;
  String? dateOfBirth;

  /// role = Mother / Father
  String? role;

  /// profileType = MotherProfile / FatherProfile
  String? profileType;

  int? pregnancyWeek;

  AuthRegisterData({
    this.fullName,
    this.email,
    this.password,
    this.dateOfBirth,
    this.role,
    this.profileType,
    this.pregnancyWeek,
  });
}