import 'package:manafea/config/base_class.dart';

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
    setLoading(true);

    final result = await _repo.createAccount(email: email, password: password);

    if (result.isSuccess) {
      connector?.navigateToVerifyEmail();
    } else {
      setLoading(false);
      return connector!.onError(result.error.toString());
    }
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
