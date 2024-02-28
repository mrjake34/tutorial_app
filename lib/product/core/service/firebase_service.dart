import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial_app/feature/auth/login/model/login_request_model.dart';
import 'package:tutorial_app/feature/auth/login/model/login_response_model.dart';

import '../../../feature/auth/register/model/register_reponse_model.dart';
import '../../../feature/auth/register/model/register_request_model.dart';
import '../enums/firebase_status.dart';

/// [FirebaseService] sınıfı Firebase Authentication servislerini kullanarak
/// kullanıcı girişi, çıkışı ve kaydı işlemlerini gerçekleştirir.
/// Tüm servislerin tek bir sınıf içerisinde toplanması kod tekrarını önler.
/// Ayrıca servislerin kullanımı kolaylaşır ve okunabilirliği artar.
/// Bu sayede kodun bakımı ve geliştirilmesi kolaylaşır.
/// Ayrıca servislerin testi kolaylaşır.
final class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<LoginResponseModel> signInWithEmail(
    LoginRequestModel model,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: model.email!,
        password: model.password!,
      );
      return LoginResponseModel(user: userCredential);
    } on FirebaseAuthException catch (e) {
      return LoginResponseModel(
          error: _FirebaseError(e.code).getFirebaseError().value);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<RegisterResponseModel> createUserWithEmailAndPassword(
      RegisterRequestModel model) async {
    try {
      final reponse = await _firebaseAuth.createUserWithEmailAndPassword(
        email: model.email!,
        password: model.password!,
      );
      return RegisterResponseModel(user: reponse);
    } on FirebaseAuthException catch (e) {
      return RegisterResponseModel(
          error: _FirebaseError(e.code).getFirebaseError().value);
    }
  }
}

/// [_FirebaseError] extension type metodu ile Firebase hata kodlarına karşılık gelen
/// [FirebaseStatus] enum'larına dönüşüm yapılır.
/// Bu sayede kod tekrarı önlenir ve kod okunabilirliği artar.
/// Ayrıca değişiklik durumunda sadece bu extension type metodu güncellenir.
extension type const _FirebaseError(String errorCode) {
  FirebaseStatus getFirebaseError() => switch (errorCode) {
        'user-not-found' => FirebaseStatus.userNotFound,
        'wrong-password' => FirebaseStatus.wrongPassword,
        'INVALID_LOGIN_CREDENTIALS' => FirebaseStatus.invalidLoginCredentials,
        'invalid-email' => FirebaseStatus.invalidEmail,
        'user-disabled' => FirebaseStatus.userDisabled,
        'too-many-requests' => FirebaseStatus.tooManyRequests,
        'operation-not-allowed' => FirebaseStatus.operationNotAllowed,
        'weak-password' => FirebaseStatus.weakPassword,
        'email-already-in-use' => FirebaseStatus.emailAlreadyInUse,
        'undefined' => FirebaseStatus.undefined,
        _ => FirebaseStatus.undefined,
      };
}
