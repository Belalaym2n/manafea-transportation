import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import '../../../../data/repositories/authRepo/forEmail/signInRepo.dart';
import '../../connector/signInConnector.dart';


class SignInViewModel extends BaseViewModel<SignInConnector> {
  final SignInFirebaseRepo _repo;

  SignInViewModel(this._repo);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {

    setLoading(true);

    final result = await _repo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    setLoading(false);

    if (result.isSuccess) {
       connector?.navigateToHome();
    } else {
      print("Login error: ${result.error}");
    return  connector?.onError(LocaleKeys.errors_invalid_credentials.tr());
    }
  }
  bool isValidEmail(String email) {
    final regex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$"
    );
    return regex.hasMatch(email);
  }

  Future<void> resetPassword({required String email}) async {
    if(!isValidEmail(email)){
      return connector!.onError(LocaleKeys.errors_invalid_email.tr());

    }
    setLoading(true);

    final result = await _repo.sendPasswordResetEmail(email: email);

    setLoading(false);

    if (result.isSuccess) {
      print(result.toString());
      connector?.showSuccessMessage(LocaleKeys.auth_auth_reset_password_email_sent.tr()
      );
    } else {


      connector?.onError(  result.error.toString());
    }
  }

}
