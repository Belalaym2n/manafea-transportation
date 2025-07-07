import 'package:firebase_auth/firebase_auth.dart';

import '../../helpers/sharedPerferance/sharedPerferanceHelper.dart';

class CreateAccountService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {


      final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user;
    if (user != null) {
      await user.sendEmailVerification();

      await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.isCreatedAccount,
        value: true,
      );
      await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.email,
        value: email,
      );
    }
    return credential;
  }


  Future<void> sendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(code: 'user-not-found', message: 'المستخدم غير موجود.');
    }

    await user.reload();
    final refreshedUser = _auth.currentUser;

     final isVerified = refreshedUser?.emailVerified ?? false;
    if (isVerified) {
      await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.userId,
        value: refreshedUser!.uid,
      );
    }
     return user.emailVerified   ;
  }

}



