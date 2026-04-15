import 'package:rafiq_app/core/errors/error_model.dart';

class EditProfileRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String dateOfBirth; // ISO 8601 UTC

  EditProfileRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
  });

  ///  Validate قبل الإرسال
  void validate() {
    if (firstName.trim().isEmpty) {
      throw ErrorModel(message: "First name is required");
    }
    if (lastName.trim().isEmpty) {
      throw ErrorModel(message: "Last name is required");
    }
    if (email.trim().isEmpty || !email.contains('@')) {
      throw ErrorModel(message: "Please enter a valid email");
    }
    if (dateOfBirth.trim().isEmpty) {
      throw ErrorModel(message: "Date of birth is required");
    }
  }

  Map<String, dynamic> toJson() => {
  "firstName": firstName.trim(),
  "lastName": lastName.trim(),
  "email": email.trim(),
  "dateOfBirth": "${dateOfBirth}T00:00:00", 
};
}