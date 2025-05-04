import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/login/connector/loginConnector.dart';

import '../../../data/repositories/authRepo/otpRepo.dart';

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
      // final validNumber = validateSaudiNumber(number: number);
      // if (validNumber == null) {
      //   return;
      // }

      print("belal");
      setLoading(true);
      await _otpRepo.sendOTP(phoneNumber: number);  // إرسال الرقم بتنسيق E.164
      await SharedPreferencesHelper.saveData(
          key: SharedSharedPreferencesKeys.phoneNumberKey,
          value: number);
      setLoading(false);
      connector!.navigateToVerify();
    } catch (e) {
      setLoading(false);
      print("❌ Failed to send OTP: ${e.toString()}");  // طباعة الخطأ في الـ console
      return connector?.onError("❌ Failed to send OTP: ${e.toString()}"); // عرض الخطأ في واجهة المستخدم
    } finally {
      setLoading(false);
    }
  }

  String? validateSaudiNumber({required String number}) {
    if (nullableNumber(number)) {
      connector?.onError("Please enter your number");
      return null;
    }

    number = number.trim();
    final regex = RegExp(r'^05\d{8}$');

    if (regex.hasMatch(number)) {
      return '+966${number.substring(1)}';
    } else {
      connector!.onError('${
        LocaleKeys.errors_please_enter_a_valid_saudi_phone_number_.tr()
      }'
      ); // الرقم غير صحيح
      return null;
    }
  }

  bool nullableNumber(String? number) {
    return number == null || number.trim().isEmpty;
  }
}
