import 'dart:convert';

import 'package:tutorial_app/feature/home/model/users.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

final class UsersResponseModel extends BaseModel {
  final List<User>? users;
  final User? user;
  final String? error;
  final int? statusCode;
  UsersResponseModel({this.users, this.user, this.error, this.statusCode});

  @override
  fromJson(dynamic json) {
    final decodedData = jsonDecode(json);
    if (decodedData is Map<String, dynamic>) {
      return UsersResponseModel(
        user: User.fromJson(decodedData),
      );
    }
    return UsersResponseModel(
      users: (decodedData as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final users = this.users?.map((user) => user.toJson()).toList();
    return {
      'users': users,
      'error': error,
      'statusCode': statusCode,
    };
  }
}
