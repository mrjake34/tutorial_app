import 'package:flutter/material.dart';
import 'package:tutorial_app/product/core/service/firebase_service.dart';

import '../model/register_request_model.dart';

final class RegisterViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService;
  bool _registerSuccess = false;
  String? _registerError;

  RegisterViewModel(this._firebaseService);

  bool get registerSuccess => _registerSuccess;
  String? get registerError => _registerError;

  Future<void> register(RegisterRequestModel registerRequestModel) async {
    final response = await _firebaseService
        .createUserWithEmailAndPassword(registerRequestModel);
    if (response.error != null) {
      _registerSuccess = false;
      _registerError = response.error;
    } else {
      _registerSuccess = true;
      _registerError = null;
    }
    if (hasListeners) {
      notifyListeners();
    }
  }
}
