import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';

import '../../../../data/repositories/authRepo/adminLoginRepo/adminLoginRepo.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../connector/signInConnector.dart';

class LoginAdminViewModel extends BaseViewModel<SignInConnector> {
  AdminLoginRepo adminLoginRepo;

  LoginAdminViewModel({required this.adminLoginRepo});

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

    final result = await adminLoginRepo.login(
      email: email,
      employeeId: password,
    );

    setLoading(false);

    if (result.isSuccess) {
      connector?.navigateToHome();
    } else {
      print("Login error: ${result.error}");
      return  connector?.onError(LocaleKeys.errors_invalid_credentials.tr());
    }
  }
}
