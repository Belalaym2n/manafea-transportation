import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/login/connector/loginConnector.dart';

import '../../../data/services/OTPServie/otpService.dart'; // Import OTP service

class LoginViewModel extends BaseViewModel<LoginConnector> {
  final OTPService otpService = OTPService(); // Create OTPService instance

  Future<void> sendVerification({required String number}) async {
    print("dsf");
    // ✅ Validate number before sending OTP
    // String? validationMessage = validateSaudiNumber(number: number);
    // if (validationMessage != null) {
    //   return; // Stop execution if number is invalid
    // }

    try {
      await otpService.sendOTP(phoneNumber: number);
      print("success");
    } catch (e) {
      print("error ${e.toString()}");
      connector?.onError("❌ Failed to send OTP: ${e.toString()}");
    }
  }

  String? validateSaudiNumber({required String number}) {
    if (nullableNumber(number)) {
      return connector?.onError("Please enter your number");
    }

    number = number.trim();

    if (!checkRegExp(number)) {
      return connector?.onError("Please enter a valid Saudi number");
    }

    return null; // ✅ Number is valid
  }

  bool checkRegExp(String number) {
    RegExp regex = RegExp(r'^(05)[0-9]{8}$');
    return regex.hasMatch(number);
  }

  bool nullableNumber(String? number) {
    return number == null || number
        .trim()
        .isEmpty;
  }
}
