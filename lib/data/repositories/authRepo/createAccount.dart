import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manafea/config/error_handling/errorHandling.dart';

import '../../../generated/locale_keys.g.dart';
import '../../services/Auth/withEmail/createAccount.dart';

class CreateAccountRepo {
  final CreateAccountService createAccountService;

  CreateAccountRepo(this.createAccountService);

  Future<Result<User>> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await createAccountService.createAccount(
        email: email,
        password: password,
      );

      return Result.success(credential.user!);
    } on FirebaseAuthException catch (e) {
      return Result.failure(_handleError(e));
    } catch (e) {
      return Result.failure('${LocaleKeys.errors_something_went_wrong.tr()}${e.toString()}');
    }
  }

  Future<Result<bool>> checkEmailVerified() async {
    try {
      final isVerified = await createAccountService.isEmailVerified();
      if (isVerified == null) {
        return Result.failure('لم يتمكن من التحقق من البريد الإلكتروني.');
      }
      return Result.success(isVerified);
    } catch (e) {
      print("error ${e.toString()}");
      return Result.failure('فشل التحقق من التفعيل: ${e.toString()}');
    }
  }


  Future<Result<String>> resendVerificationEmail() async {
    try {
      await createAccountService.sendVerificationEmail();
      return Result.success('تم إرسال رابط التحقق بنجاح.');
    } catch (e) {
      return Result.failure('فشل إرسال التحقق: ${e.toString()}');
    }
  }

  String _handleError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return LocaleKeys.errors_email_already_in_use.tr();
      case 'invalid-email':
        return LocaleKeys.errors_invalid_email.tr();
      case 'weak-password':
        return LocaleKeys.errors_weak_password.tr();
      default:
        return LocaleKeys.errors_default_error.tr();
    }
  }
}
