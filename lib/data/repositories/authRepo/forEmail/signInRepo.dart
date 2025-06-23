import '../../../../config/error_handling/errorHandling.dart';
 import '../../../services/Auth/withEmail/signIn.dart';
 import 'package:firebase_auth/firebase_auth.dart';

class SignInFirebaseRepo {
  final SignInFirebaseService _service;

  SignInFirebaseRepo(this._service);

  Future<Result<UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _service.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  Future<Result<void>> sendPasswordResetEmail({required String email}) {
    return _service.sendPasswordResetEmail(email: email);
  }

}
