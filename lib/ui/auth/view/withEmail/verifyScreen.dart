import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/auth/connector/creatAccountConnector.dart';
import 'package:manafea/ui/auth/view/personalDetails/personalDetailedView.dart';
import 'package:manafea/ui/auth/viewModel/forEmail/verifyEmailViewModel.dart';
import 'package:manafea/ui/auth/widgets/forEmail/verifyEmailItem.dart';
import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../../data/repositories/authRepo/createAccount.dart';
import '../../../../data/services/Auth/withEmail/createAccount.dart';
import '../../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState
    extends BaseView<VerifyEmailViewModel, VerifyEmailScreen>
    implements CreateAccountConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cge();
    viewModel.connector = this;
  }
  cge() async {
    final userId = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.userId);
    print("iser user $userId");
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer<VerifyEmailViewModel>(
            builder: (context, value, child) => Scaffold(
                    body: Stack(children: [
                  VerifyEmailItem(
                    resendVerification: value.resendVerificationEmail,
                    verifyEmail: value.verifyEmail,
                  ),
                  if (value.isLoading) showLoading()
                ]))));
  }

  @override
  VerifyEmailViewModel init_my_view_model() {
    CreateAccountService createAccountService = CreateAccountService();
    CreateAccountRepo repo = CreateAccountRepo(createAccountService);

    // TODO: implement init_my_view_model
    return VerifyEmailViewModel(repo);
  }

  @override
  navigateToVerifyEmail() {
    // TODO: implement navigateToVerifyEmail
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PersonalDetailedScreen()),
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
}
