import 'dart:convert';

import 'package:tutorial_app/feature/home/model/user.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

final class UsersResponseModel extends BaseModel {
  final List<User>? users;
  final User? user;
  final String? error;
  final int? statusCode;
  UsersResponseModel({this.users, this.user, this.error, this.statusCode});

  @override
  fromJson(dynamic json) {
    /// [dynamic] gelen veri önce jsonDecode ile decode edilir.
    final decodedData = jsonDecode(json);

    /// [decodedData] Map ise
    /// [User] sınıfından bir nesne oluşturulur.
    if (decodedData is Map<String, dynamic>) {
      return UsersResponseModel(
        user: User.fromJson(decodedData),
      );
    }

    /// [decodedData] List ise
    /// içerisinde [User] sınıfı nesneleri barındıran bir liste oluşturulur.
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
    };
  }
}
