import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
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
      final validNumber = validateSaudiNumber(number: number);
      if (validNumber == null) {
        return;
      }

      setLoading(true);
      await Future.delayed(const Duration(seconds: 1));
      await _otpRepo.sendOTP(phoneNumber: validNumber);
      await SharedPreferencesHelper.saveData(
          key: SharedSharedPreferencesKeys.phoneNumberKey
          , value: validNumber);
      setLoading(false);
      connector!.navigateToVerify();
    } catch (e) {
      setLoading(false);
      connector
          ?.onError("❌ Failed to send OTP Please Try Again: ${e.toString()}");
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
      connector!.onError(
          "Please enter a valid Saudi phone number like: 0501234567 "); // الرقم غير صحيح
      return null;
    }
  }

  bool nullableNumber(String? number) {
    return number == null || number.trim().isEmpty;
  }
}
