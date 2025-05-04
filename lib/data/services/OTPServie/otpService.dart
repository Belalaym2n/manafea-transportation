import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/sharedPerferance/sharedPerferanceHelper.dart';

class OTPService {
  static OTPService? _instance;

  OTPService._internal();

  factory OTPService() {
    _instance ??= OTPService._internal();
    return _instance!;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId; // Store verification ID for manual OTP verification



  Future<void> sendOTP({required String phoneNumber}) async {
    final completer = Completer<void>();

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: (FirebaseAuthException e) {
          print("❌ OTP Error: ${e.code} - ${e.message}");
          completer.completeError(Exception("OTP Verification Failed: ${e.message}"));
        },
        codeSent: (String verificationID, int? resendToken) {
          print("📩 OTP has been sent.");
          verificationId = verificationID;
          completer.complete(); // ✅ نجاح
        },
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 118),
      );

      return completer.future;
    } catch (e) {
      print("❌ General Error: ${e.toString()}");
      throw Exception("Error during OTP sending: ${e.toString()}");
    }
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid;
        await SharedPreferencesHelper.saveData(
            key: SharedSharedPreferencesKeys.userId,
            value: uid);
      }
      print("✅ Auto verification successful!");
    } catch (e) {
      print("❌ Auto verification failed: $e");
    }
  }

  verificationFailed(FirebaseAuthException e) {
    // طباعة الخطأ ورفعه للـ UI
    print("❌ OTP Error: ${e.code} - ${e.message}");
    throw Exception("OTP Verification Failed: ${e.message}"); // رفع الاستثناء
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
      throw Exception(e.toString());
    }
  }
}
