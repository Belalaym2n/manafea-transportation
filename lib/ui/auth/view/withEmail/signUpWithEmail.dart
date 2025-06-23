import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/authRepo/createAccount.dart';
import 'package:manafea/data/services/Auth/withEmail/createAccount.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/auth/connector/creatAccountConnector.dart';
import 'package:manafea/ui/auth/viewModel/forEmail/creatAcountViewModel.dart';
import 'package:manafea/ui/auth/widgets/forEmail/signUpWidget.dart';
import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _SignUpScreenState extends BaseView<CreateAccountViewModel,
    SignUpScreen>
    implements CreateAccountConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     viewModel.connector=this;
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer<CreateAccountViewModel>(
              builder: (context, value, child) => Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    SignUpItem(
                      createAccount: value.createAccount,
                      emailController: email,
                      passwordController: password,
                    ),
                    if (value.isLoading) showLoading()
                  ],
                ),
              ),
            ));
  }

  @override
  CreateAccountViewModel init_my_view_model() {
    CreateAccountService createAccountService = CreateAccountService();
    CreateAccountRepo repo = CreateAccountRepo(createAccountService);

    // TODO: implement init_my_view_model
    return CreateAccountViewModel(repo);
  }

  @override
  navigateToVerifyEmail() {
    // TODO: implement navigateToVerifyEmail
    return Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.verifyEmail,(route) => false,);
  }

  @override
  onError(String message) {
    // TODO: implement onError
    return error_widget(context: context, message: message);
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    return LoadingWidget();
  }
}
