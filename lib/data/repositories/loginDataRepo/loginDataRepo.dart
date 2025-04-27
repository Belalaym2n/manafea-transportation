import 'package:manafea/data/services/loginDataServie/loginDataService.dart';
import 'package:manafea/domain/models/userModel/userModel.dart';

class LoginDataRepo {
  LoginDataService loginDataService;

  LoginDataRepo(this.loginDataService);

  Future<void> uploadUserToDatabase({required UserModel user}) async {
    try {
      await loginDataService.uploadUserDataToDatabase(user: user);
    } catch (e) {
      throw Exception();
    }
  }
}
