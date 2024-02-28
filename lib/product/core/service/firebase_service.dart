import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial_app/feature/login/model/login_response_model.dart';

import '../enums/firebase_status.dart';

final class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<LoginResponseModel> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return LoginResponseModel(user: userCredential.user);
    } on FirebaseAuthException catch (e) {
      return LoginResponseModel(
          error: _FirebaseError(e.code).getFirebaseError().value);
    }
  }
}

extension type const _FirebaseError(String errorCode) {
  FirebaseStatus getFirebaseError() => switch (errorCode) {
        'user-not-found' => FirebaseStatus.invalidArgument,
        'wrong-password' => FirebaseStatus.notFound,
        'invalid-email' => FirebaseStatus.alreadyExists,
        'user-disabled' => FirebaseStatus.permissionDenied,
        'too-many-requests' => FirebaseStatus.unauthenticated,
        'operation-not-allowed' => FirebaseStatus.resourceExhausted,
        'weak-password' => FirebaseStatus.aborted,
        'email-already-in-use' => FirebaseStatus.outOfRange,
        'undefined' => FirebaseStatus.undefined,
        _ => FirebaseStatus.undefined,
      };
}
