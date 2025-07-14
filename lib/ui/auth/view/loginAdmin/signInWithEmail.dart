import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/services/Auth/loginAdminWithMail/loginAdminWithEmailService.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/auth/viewModel/forLoginAdmin/loginAdmin.dart';
import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../../config/checkNetwork/mainWrapper.dart';
import '../../../../data/repositories/authRepo/adminLoginRepo/adminLoginRepo.dart';
import '../../connector/signInConnector.dart';
import '../../widgets/forEmail/signInItem.dart';

class SingInAdmin extends StatefulWidget {
  SingInAdmin({super.key});

  @override
  State<SingInAdmin> createState() => _SingInAdminState();
}

class _SingInAdminState extends BaseView<LoginAdminViewModel, SingInAdmin>
    implements SignInConnector {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MainWrapper(
        childWidget: ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer<LoginAdminViewModel>(
              builder: (context, value, child) =>AbsorbPointer(
                absorbing: value.isLoading,
                child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    SignInItem(
                      isAdmin: true,
                      signIn: value.signIn,
                      emailController: email,
                      passwordController: password,
                    ),
                    if (value.isLoading) showLoading()
                  ],
                ),
              ),
              ))));
  }

  @override
  LoginAdminViewModel init_my_view_model() {
    LoginAdminWithEmailFirebaseService loginAdminWithEmailFirebaseService =
        LoginAdminWithEmailFirebaseService();
    AdminLoginRepo adminLoginRepo = AdminLoginRepo(
        loginAdminWithEmailFirebaseService: loginAdminWithEmailFirebaseService);
    // TODO: implement init_my_view_model
    return LoginAdminViewModel(adminLoginRepo: adminLoginRepo);
  }

  @override
  navigateToHome() {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.bottomNavAdmin,
      (route) => false,
    );
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    return const LoadingWidget();
  }

  @override
  showSuccessMessage(String message) {
    // TODO: implement showSuccessMessage
    throw UnimplementedError();
  }
}
