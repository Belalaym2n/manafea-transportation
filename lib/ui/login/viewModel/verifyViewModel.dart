import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/login/connector/verifyConnector.dart';

import '../../../data/repositories/authRepo/otpRepo.dart';
import '../connector/loginConnector.dart';

class VerifyViewModel extends BaseViewModel<VerifyConnector> {
  final OTPRepo _otpRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  VerifyViewModel(this._otpRepo);



  Future<void> verifyNumber(String smsCode) async {
    setLoading(true);

    try {
      print("object");
      await Future.delayed(const Duration(seconds: 1));

      await _otpRepo.verifyNumber(smsCode: smsCode);
      await setLoading(false);

      connector!.navigateToPersonalDetailed();
    } catch (e) {
    await  setLoading(false);
      return connector!.onError("❌ Verification failed: ${e.toString()}");
    }
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
