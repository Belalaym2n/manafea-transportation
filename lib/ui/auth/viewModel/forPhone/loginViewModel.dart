import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../../data/repositories/authRepo/otpRepo.dart';
import '../../connector/loginConnector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  final OTPRepo _otpRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  LoginViewModel(this._otpRepo);

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> sendVerification({required String number}) async {
    try {
      print("belal");
      setLoading(true);
      await _otpRepo.sendOTP(phoneNumber: number); // إرسال الرقم بتنسيق E.164
      await SharedPreferencesHelper.saveData(
          key: SharedSharedPreferencesKeys.phoneNumberKey, value: number);
      setLoading(false);
      connector!.navigateToVerify();
    } catch (e) {
      setLoading(false);
      return connector?.onError(e.toString()); // عرض الخطأ في واجهة المستخدم
    } finally {
      setLoading(false);
    }
  }
}
