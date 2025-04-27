import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/loginDataRepo/loginDataRepo.dart';

import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../../domain/models/userModel/userModel.dart';
import '../connector/personalDetailedConnector.dart';

class PersonalDetailedViewModel
    extends BaseViewModel<PersonalDetailedConnector> {
  LoginDataRepo loginDataRepo;
  bool _isLoading = false;
  String? _phoneNumber;

  bool get isLoading => _isLoading;

  String? get phoneNumber => _phoneNumber;

  PersonalDetailedViewModel(this.loginDataRepo);

  uploadUserToDatabase({required UserModel user}) async {
    setLoading(true);
    await loadPhoneNumber();
    bool notNull = isNullable(user);
    if (!notNull) {
      setLoading(false);
      return connector!.onError("please enter firstName and lastName");
    }
    try {
      await loginDataRepo.uploadUserToDatabase(user: user);
    await  saveData(user);
      connector!.navigateToHomeScreen();
    } catch (e) {
      connector!.onError("Something went wrong please try again");
    } finally {
      setLoading(false);
    }
  }

  saveData(UserModel user) async {
    print("USER ${user.lastName}");
    print("USER ${user.firstName}");
    await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.firsName, value: user.firstName);

    await SharedPreferencesHelper.saveData(
        key: SharedSharedPreferencesKeys.lastName, value: user.lastName);
  }

  bool isNullable(UserModel user) {
    return user.firstName.trim().isNotEmpty &&
        user.lastName.trim().isNotEmpty &&
        user.phoneNumber.trim().isNotEmpty;
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  loadPhoneNumber() async {
    _phoneNumber = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.phoneNumberKey);
    notifyListeners();
  }
}
