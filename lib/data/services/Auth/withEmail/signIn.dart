import 'package:firebase_auth/firebase_auth.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../../config/error_handling/errorHandling.dart';

class SignInFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Result<UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
  print("object${userCredential.user!.uid}");


      await saveId(userCredential.user!.uid,email);
      return Result.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return Result.failure(e.message ?? "Login failed. Please try again.");
    } catch (e) {
      return Result.failure("Something went wrong. Please try again.");
    }
  }

  saveId(String userId,String email) async {
   await SharedPreferencesHelper.saveData(key: SharedSharedPreferencesKeys.userId, value: userId);
   await SharedPreferencesHelper.saveData(key:
   SharedSharedPreferencesKeys.signInWithEmail, value: true);
   await SharedPreferencesHelper.saveData(key:
   SharedSharedPreferencesKeys.email, value: email);

  } 

  Future<Result<void>> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return Result.success(null);
    } on FirebaseAuthException catch (e) {
      return Result.failure(e.message ?? "Failed to send reset email.");
    } catch (e) {
      return Result.failure("Something went wrong.");
    }
  }

  checkEmailRegex(){

  }
}
