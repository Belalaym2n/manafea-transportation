import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/login/connector/verifyConnector.dart';

import '../../../data/repositories/authRepo/otpRepo.dart';
import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../generated/locale_keys.g.dart';
import '../connector/loginConnector.dart';

class VerifyViewModel extends BaseViewModel<VerifyConnector> {
  final OTPRepo _otpRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  VerifyViewModel(this._otpRepo);



  Future<void> verifyNumber(String smsCode) async {
    setLoading(true);
    try {
       await Future.delayed(const Duration(seconds: 1));

      await _otpRepo.verifyNumber(smsCode: smsCode);
      await saveUserId();
      await setLoading(false);

      connector!.navigateToPersonalDetailed();
    } catch (e) {
    await  setLoading(false);
      return connector!.onError(
    "${LocaleKeys.errors_auto_verification_failed___e.tr()}:${e.toString()}");
    }
  }

  saveUserId()async{
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      print("🔑 UID: $uid");

      await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.userId,
        value: uid,
      );

     } else {
     }
  }
  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
