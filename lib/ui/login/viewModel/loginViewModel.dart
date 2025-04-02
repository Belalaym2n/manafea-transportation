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

  bool _isDisposed =
      false; // إضافة متغير لتتبع إذا كان الـ ViewModel تم التخلص منه.
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> sendVerification({required String number}) async {
    try {
      validateSaudiNumber(number: number);
      setLoading(true);
      await Future.delayed(const Duration(seconds: 1));
      await _otpRepo.sendOTP(phoneNumber: number);
      setLoading(false);

      await SharedPreferencesHelper.saveData(key: "phoneNumber", value: number);

      await Future.delayed(const Duration(milliseconds: 300));
      connector!.navigateToVerify();
    } catch (e) {
      setLoading(false);
      connector?.onError("❌ Failed to send OTP: ${e.toString()}");
    } finally {
      setLoading(false); // تأكد من إيقاف اللودينج بعد تنفيذ العملية
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

  bool nullableNumber(String? number) {
    return number == null || number.trim().isEmpty;
  }
}
