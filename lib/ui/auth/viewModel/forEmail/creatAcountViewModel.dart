import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../../data/repositories/authRepo/createAccount.dart';
import '../../connector/creatAccountConnector.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountConnector> {
  final CreateAccountRepo _repo;

  CreateAccountViewModel(this._repo);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
if(!isValidEmail(email)){
  return connector!.onError(LocaleKeys.errors_invalid_email.tr());

}
setLoading(true);

    final result = await _repo.createAccount(email: email, password: password);

    if (result.isSuccess) {
      connector?.navigateToVerifyEmail();
    } else {
      setLoading(false);
      return connector!.onError(result.error.toString());
    }
  }
  bool isValidEmail(String email) {
    final regex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$"
    );
    return regex.hasMatch(email);
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
