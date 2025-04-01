import 'package:manafea/data/services/OTPServie/otpService.dart';

class OTPRepo {
  OTPService otpService;

  OTPRepo(this.otpService);

  sendOTP({required String phoneNumber}) {
    try {
      otpService.sendOTP(phoneNumber: "+201114324251");
    } catch (e) {
      Exception exception;
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

 String? getVerificationId(){
    return otpService.getVerificationId();
  }

}
