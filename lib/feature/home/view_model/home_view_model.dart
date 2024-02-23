import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/model/users.dart';
import '../service/home_service.dart';

final class HomeViewModel extends ChangeNotifier {
  List<User>? _users;
  User? _user;
  int? _statusCode;
  String? _error;

  List<User>? get users => _users;
  User? get user => _user;
  int? get statusCode => _statusCode;
  String? get error => _error;

  final _homeService = HomeService();

  Future<void> setUsers() async {
    final response = await _homeService.getUsers();
    _users = response.users;
    _statusCode = response.statusCode;
    _error = response.error;
    notifyListeners();
  }

  Future<void> setUser(int id) async {
    final response = await _homeService.getUser(id);
    _user = response.user;
    _statusCode = response.statusCode;
    _error = response.error;
    notifyListeners();
  }
}
