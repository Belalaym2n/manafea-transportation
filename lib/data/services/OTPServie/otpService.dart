import 'package:firebase_auth/firebase_auth.dart';

class OTPService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId; // Store verification ID for manual OTP verification

  Future<void> sendOTP({required String phoneNumber}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+201116427908",
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      timeout: const Duration(seconds: 120),
      forceResendingToken: null, // 🔹 اختياري: تعطيل إعادة الإرسال الإجباري
      multiFactorSession: null, // 🔹 تعطيل التحقق الثنائي
    );
  }
  String? getVerificationId() {
    return verificationId;
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential,
      );
      print("✅ Auto verification successful!");
    } catch (e) {
      print("❌ Auto verification failed: $e");
    }
  }

  verificationFailed(FirebaseAuthException e) {
    print("❌ OTP Error: ${e.code} - ${e.message}");
  }

  void codeSent(String verificationID, int? resendToken) {
    print("📩 OTP has been sent. Verification ID: $verificationId");
    verificationId = verificationID;
    print("📩 OTP has been sent. Verification ID: $verificationId");

  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("⏳ OTP auto-retrieval timed out. Verification ID: $verificationId");
    this.verificationId = verificationId; // Store verification ID
  }
  Future<void> verifyOTP(String smsCode) async {
    try {
      print("📝 Verifying OTP...");
      print("🔍 Current Verification ID: $verificationId");

      if (verificationId == null) {
        print("❌ Error: No verification ID found. Please request OTP again.");
        return;
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      await auth.signInWithCredential(credential);
      print("✅ OTP Verified! User signed in.");
    } catch (e) {
      print("❌ OTP Verification Failed: ${e.toString()}");
      throw Exception();
    }
  }

}
