import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../generated/locale_keys.g.dart';
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
  String? validateSaudiNumber({required String number}) {
    number =
        number.trim().replaceAll(RegExp(r'\s+'), ''); // إزالة المسافات البيضاء
    final regex = RegExp(r'^05\d{8}$');

    if (regex.hasMatch(number)) {
      return '+966${number.substring(1)}';
    } else {
      return null;
    }
  }

  Future<void> sendOTP({required String phoneNumber}) async {
    final completer = Completer<void>();
    final formattedNumber = validateSaudiNumber(number: phoneNumber);
    if (formattedNumber == null) {
      throw Exception(
          LocaleKeys.errors_please_enter_a_valid_saudi_phone_number_.tr());
    }

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: formattedNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: (FirebaseAuthException e) {
          print("❌ OTP Error: ${e.code} - ${e.message}");
          completer.completeError(
              Exception("OTP Verification Failed: ${e.message}"));
        },
        codeSent: (String verificationID, int? resendToken) {
          print("📩 OTP has been sent.");
          verificationId = verificationID;
          completer.complete();
        },
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 118),
      );

      return completer.future;
    } catch (e) {
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
            key: SharedSharedPreferencesKeys.userId, value: uid);
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
      if (verificationId == null) {
        return;
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      await auth.signInWithCredential(credential);
      await saveUserId();
    } catch (e) {
      throw Exception(LocaleKeys.errors_auto_verification_failed___e.tr());
    }
  }

  saveUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      print("🔑 UID: $uid");

      await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.userId,
        value: uid,
      );
    } else {}
  }
}
