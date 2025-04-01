import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/login/connector/loginConnector.dart';

import '../../../data/repositories/authRepo/otpRepo.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  final OTPRepo _otpRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  LoginViewModel(this._otpRepo);

  Future<void> sendVerification({required String number}) async {
    try {
      validateSaudiNumber(number: number);
      setLoading(true);
      await Future.delayed(
          const Duration(seconds: 1)); // ✅ انتظر قبل تنفيذ الطلب
      await _otpRepo.sendOTP(phoneNumber: number);
      await setLoading(false);


SharedPreferencesHelper.saveData(key: "phoneNumber", value: number);
print(await SharedPreferencesHelper.getData("phoneNumber"));
      await Future.delayed(
          const Duration(milliseconds: 300)); // ✅ انتظر قبل تنفيذ الطلب
      connector!.navigateToVerify();
    } catch (e) {
      setLoading(false);
      connector?.onError("❌ Failed to send OTP: ${e.toString()}");
    } finally {
      setLoading(
          false); // ❌ لا يجب أن يكون `true` هنا، بل `false` لإخفاء اللودينج
    }
  }

  Future<void> verifyNumber(String smsCode) async {
    try {
      String? verificationId = _otpRepo.getVerificationId();
      if (verificationId == null) {
        throw Exception("No verification ID found. Request OTP again.");
      }
      await _otpRepo.verifyNumber(smsCode: smsCode);
      connector!.navigateToPersonalDetailed();
    } catch (e) {
      print(await SharedPreferencesHelper.getData("phoneNumber"));

      print("❌ Verification error: $e");
      setLoading(false);
      connector?.onError("❌ Verification failed: ${e.toString()}");
    }
  }

  String? validateSaudiNumber({required String number}) {
    if (nullableNumber(number)) {
      return connector?.onError("Please enter your number");
    }

    number = number.trim();

    // if (!checkRegExp(number)) {
    //   return connector?.onError("Please enter a valid Saudi number");
    // }

    return null; // ✅ Number is valid
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading; // عدّلنا السطر ده
    notifyListeners(); // نخبر الواجهة بضرورة التحديث
  }

  bool nullableNumber(String? number) {
    return number == null || number.trim().isEmpty;
  }
}
