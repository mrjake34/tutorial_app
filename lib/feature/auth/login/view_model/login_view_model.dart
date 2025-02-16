import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/auth/login/model/login_request_model.dart';
import 'package:tutorial_app/product/core/constants/remote_config_keys.dart';
import 'package:tutorial_app/product/utils/remote_config/remote_config_manager.dart';
import '../../../../product/core/service/firebase_service.dart';
import '../model/login_response_model.dart';

final class LoginViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  UserCredential? _userCredential;
  String _error = '';
  String _remoteConfigValue = '';

  UserCredential? get userCredential => _userCredential;
  String? get error => _error;
  String? get remoteConfigValue => _remoteConfigValue;

  Future<void> signInWithEmail(LoginRequestModel model) async {
    if (model.email == null || model.password == null) {
      return;
    }
    final LoginResponseModel response = await _firebaseService.signInWithEmail(
      model,
    );

    _userCredential = response.user;
    _error = response.error ?? '';
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// [getRemoteConfig] metodu ile remote config'ten veri çekilir.
  /// Burada veri keyi sabit olarak verilmiştir çünkü metodun yapacağı işlem önceden bellidir.
  Future<void> getRemoteConfig() async {
    RemoteConfigManager.fetchAndActivate();
    final response = RemoteConfigManager.getString(
      RemoteConfigKeys.loginBackgroundImage,
    );
    _remoteConfigValue = response;
    if (hasListeners) {
      notifyListeners();
    }
  }

  void logout() {
    _userCredential = null;
    _error = '';
    _remoteConfigValue = '';
    if (!hasListeners) return;
    notifyListeners();
  }
}
