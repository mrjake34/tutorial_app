final class RegisterRequestModel {
  final String? email;
  final String? password;

  RegisterRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
