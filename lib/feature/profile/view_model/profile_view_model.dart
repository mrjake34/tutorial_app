import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/product/core/service/firebase_service.dart';

import '../model/profile_model.dart';

final class ProfileViewModel extends ChangeNotifier {
  ProfileModel? _userModel;
  String? _error;
  bool? _isSuccess;
  final FirebaseService _firebaseService = FirebaseService();

  ProfileModel? get userModel => _userModel;
  String? get error => _error;
  bool? get isSuccess => _isSuccess;

  Future<void> fetchUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final response =
        await _firebaseService.getModelFirebaseFirestore<ProfileModel>(
      colPath: FirestorePath.users,
      docPath: currentUser?.uid,
      model: const ProfileModel(),
    );
    _userModel = response.data;
    _error = response.error;
    _isSuccess = response.isSuccess;
    if (!hasListeners) return;
    notifyListeners();
  }

  Future<void> logout() async {
    _userModel = null;
    _error = null;
    _isSuccess = null;
    await FirebaseAuth.instance.signOut();
    if (!hasListeners) return;
    notifyListeners();
  }
}
