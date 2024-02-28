import 'package:tutorial_app/feature/home/view/index.dart';

import '../../../product/core/service/firebase_service.dart';
import '../model/login_response_model.dart';

final class LoginViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  LoginResponseModel? _loginResponseModel;

  LoginResponseModel? get loginResponseModel => _loginResponseModel;

  Future<void> signInWithEmail({String? email, String? password}) async {
    if (email == null || password == null) {
      return;
    }
    final LoginResponseModel response = await _firebaseService.signInWithEmail(
      email: email,
      password: password,
    );
    _loginResponseModel = response;
    if (hasListeners) {
      notifyListeners();
    }
  }
}
