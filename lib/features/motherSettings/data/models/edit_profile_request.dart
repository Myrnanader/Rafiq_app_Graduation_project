class EditProfileRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String dateOfBirth;

  EditProfileRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dateOfBirth": dateOfBirth,
      };
}