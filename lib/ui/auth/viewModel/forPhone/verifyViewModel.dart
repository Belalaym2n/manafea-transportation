import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manafea/config/base_class.dart';

import '../../../../data/repositories/authRepo/otpRepo.dart';
import '../../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../connector/loginConnector.dart';
import '../../connector/verifyConnector.dart';

class VerifyViewModel extends BaseViewModel<VerifyConnector> {
  final OTPRepo _otpRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? _phone;

  String? get phone => _phone;

  Future<void> getUserIfo() async {
    _phone = await SharedPreferencesHelper.getData(
      SharedSharedPreferencesKeys.phoneNumberKey,
    );
    notifyListeners();
  }

  VerifyViewModel(this._otpRepo);

  Future<void> verifyNumber(String smsCode) async {
    setLoading(true);
    try {

      await _otpRepo.verifyNumber(smsCode: smsCode);
       await setLoading(false);

      connector!.navigateToPersonalDetailed();
    } catch (e) {
      await setLoading(false);
      return connector!.onError(
          "${LocaleKeys.errors_auto_verification_failed___e.tr()}:${e.toString()}");
    }
  }


  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

 }
