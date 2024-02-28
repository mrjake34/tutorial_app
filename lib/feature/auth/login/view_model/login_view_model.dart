import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial_app/feature/auth/login/model/login_request_model.dart';
import 'package:tutorial_app/feature/home/view/index.dart';
import '../../../../product/core/service/firebase_service.dart';
import '../model/login_response_model.dart';

final class LoginViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  UserCredential? _userCredential;
  String _error = '';

  UserCredential? get userCredential => _userCredential;
  String? get error => _error;

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
}
