import 'package:firebase_auth/firebase_auth.dart';

final class RegisterResponseModel {
  final String? error;
  final UserCredential? user;

  RegisterResponseModel({
    this.error,
    this.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
    };
  }
}
