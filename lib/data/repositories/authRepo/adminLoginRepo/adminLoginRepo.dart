import 'package:manafea/config/error_handling/errorHandling.dart';

import '../../../services/Auth/loginAdminWithMail/loginAdminWithEmailService.dart';

class AdminLoginRepo {
  LoginAdminWithEmailFirebaseService loginAdminWithEmailFirebaseService;

  AdminLoginRepo({required this.loginAdminWithEmailFirebaseService});

  Future<Result> login({
    required String email,
    required String employeeId,
  }) async {
    return await loginAdminWithEmailFirebaseService.login(
        email: email, employeeId: employeeId);
  }
}
