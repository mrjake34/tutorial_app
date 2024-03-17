final class RegisterRequestModel {
  final String? fullName;
  final String? email;
  final String? password;
  final String? phoneNumber;

  RegisterRequestModel({
    this.email,
    this.password,
    this.fullName,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }
}
