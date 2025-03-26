import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/connector/loginConnector.dart';
import 'package:manafea/ui/login/viewModel/loginViewModel.dart';

import '../../../routing/appRoutes.dart';
import '../widgets/loginItem.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginViewModel,
    LoginScreen>
    implements LoginConnector {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return LoginItem(
      checkNumberValidation: () {
        Navigator.pushNamed(context, AppRoutes.verifyScreen);

        // print(    phoneNumberController.text);
        // viewModel.sendVerification(number: "+201114324251");
        // // phoneNumberController.text);
      },
      controller: phoneNumberController,
    );
  }

  @override
  LoginViewModel init_my_view_model() {

    // TODO: implement init_my_view_model
    return LoginViewModel();
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }


}
