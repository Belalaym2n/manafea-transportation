import 'package:manafea/data/services/OTPServie/otpService.dart';

class OTPRepo {
  OTPService otpService;

  OTPRepo(this.otpService);

 Future<void> sendOTP({required String phoneNumber}) async {
    try {
       return  await otpService.sendOTP(phoneNumber: phoneNumber);
    } catch (e) {
      throw Exception("OTP Verification Failed: $e");
    }
  }

  verifyNumber
    ({required String smsCode}) async {
      try {
        await otpService.verifyOTP(smsCode);
      } catch (e) {
        print("❌ Error in verifyNumber: ${e.toString()}");
        throw Exception("Failed to verify OTP: ${e.toString()}");
      }
    }


}
