import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/loginDataRepo/loginDataRepo.dart';

import '../../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../../domain/models/userModel/userModel.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../connector/personalDetailedConnector.dart';

class PersonalDetailedViewModel
    extends BaseViewModel<PersonalDetailedConnector> {
  LoginDataRepo loginDataRepo;
  bool _isLoading = false;
  String? _phoneNumber;
  String? _email;

  bool get isLoading => _isLoading;

  String? get phoneNumber => _phoneNumber;

  String? get email => _email;

  PersonalDetailedViewModel(this.loginDataRepo);

  uploadUserToDatabase({required UserModel user}) async {
    setLoading(true);
     await loadData();
    bool notNull = isNullable(user);
    if (!notNull) {
      setLoading(false);
      return connector!
          .onError(LocaleKeys.errors_name_and_number_must_not_be_empty.tr());
    }
    try {
      await loginDataRepo.uploadUserToDatabase(user: user);
      await saveData(user);
      connector!.navigateToHomeScreen();
    } catch (e) {
      connector!
          .onError(LocaleKeys.errors_something_went_wrong_please_try_again);
    } finally {
      setLoading(false);
    }
  }

  saveData(UserModel user) async {
    await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.firsName, value: user.firstName);

    await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.lastName, value: user.lastName);
  }

  bool isNullable(UserModel user) {
    return user.firstName.trim().isNotEmpty && user.lastName.trim().isNotEmpty;
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  loadData() async {
    _phoneNumber = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.phoneNumberKey);
    _email = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.email);
    notifyListeners();
  }
}
