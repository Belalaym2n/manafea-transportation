import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/authRepo/forEmail/signInRepo.dart';
import 'package:manafea/data/services/Auth/withEmail/signIn.dart';
import 'package:manafea/ui/auth/viewModel/forEmail/creatAcountViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../config/checkNetwork/mainWrapper.dart';
import '../../../../data/repositories/authRepo/createAccount.dart';
import '../../../../data/services/Auth/withEmail/createAccount.dart';
import '../../../../routing/appRoutes.dart';
import '../../../core/shared_widget/error_widget.dart';
import '../../connector/signInConnector.dart';
import '../../viewModel/forEmail/signInViewModel.dart';
import '../../widgets/forEmail/signInItem.dart';
import '../../widgets/loadingWidget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseView<SignInViewModel, SignInScreen>
    implements SignInConnector {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return MainWrapper(
        childWidget:  ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer<SignInViewModel>(
              builder: (context, value, child) => Scaffold(
                resizeToAvoidBottomInset: false,

                body: Stack(
                  children: [
                    SignInItem(
                      signIn: value.signIn ,
                      emailController: email,
                      passwordController: password,
                    ),
                    if (value.isLoading) showLoading()
                  ],
                ),
              ),
            )));
  }

  @override
  SignInViewModel init_my_view_model() {
    SignInFirebaseService signInFirebaseService = SignInFirebaseService();
    SignInFirebaseRepo repo = SignInFirebaseRepo(signInFirebaseService);

    // TODO: implement init_my_view_model
    return SignInViewModel(repo);
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

  @override
  navigateToHome() {
    // TODO: implement navigateToHome

    return Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.bottomNav,
      (route) => false,
    );
  }

  @override
  showSuccessMessage(String message) {
    // TODO: implement showSuccessMessage
    throw UnimplementedError();
  }
}
