import 'package:firebase_auth/firebase_auth.dart';

final class LoginResponseModel {
  final UserCredential? user;
  final String? error;

  LoginResponseModel({
    this.user,
    this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
    };
  }
}
