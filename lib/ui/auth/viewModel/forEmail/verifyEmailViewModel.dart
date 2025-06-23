import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/auth/connector/creatAccountConnector.dart';

import '../../../../data/repositories/authRepo/createAccount.dart';

class VerifyEmailViewModel extends BaseViewModel<CreateAccountConnector> {
  final CreateAccountRepo _repo;

  VerifyEmailViewModel(this._repo);

  bool isLoading = false;

  Future<void> verifyEmail() async {
    setLoading(true); // بدء التحميل
    final result = await _repo.checkEmailVerified();

    if (result.isSuccess && result.data != null && result.data!) {
      return connector
          ?.navigateToVerifyEmail(); // الانتقال إلى الشاشة التالية إذا كان البريد مفعلًا
    } else {
      connector?.onError(
          LocaleKeys.errors_verify_email_error.tr()); // إظهار رسالة الخطأ
    }
    setLoading(false); // إيقاف التحميل
  }

  Future<void> resendVerificationEmail() async {
    setLoading(true);
    final result = await _repo.resendVerificationEmail();
    if (result.isSuccess) {
      setLoading(false);
      connector?.onError(result.data!);
    } else {
      setLoading(false);
      connector?.onError(result.error.toString());
    }
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners(); // إشعار المستمعين بتغير الحالة
  }
}
