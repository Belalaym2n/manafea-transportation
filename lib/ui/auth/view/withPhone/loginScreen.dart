import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/authRepo/otpRepo.dart';
import 'package:manafea/data/services/OTPServie/otpService.dart';
import 'package:manafea/ui/auth/view/withPhone/verifyOtpNumberScreen.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';

import 'package:provider/provider.dart';
import '../../connector/loginConnector.dart';
import '../../viewModel/forPhone/loginViewModel.dart';
import '../../widgets/loadingWidget.dart';
import '../../widgets/forPhone/loginItem.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginViewModel, LoginScreen>
    implements LoginConnector {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<LoginViewModel>(builder: (context, view, child) {
          return AbsorbPointer(
              absorbing: view.isLoading,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                  body: Stack(
                children: [
                  LoginItem(
                    sendOTP: () {
                      viewModel.sendVerification(
                          number: phoneNumberController.text);
                    },
                    controller: phoneNumberController,
                  ),
                  if (view
                      .isLoading) // إذا كان في حالة تحميل، عرض الـ loading indicator
                    showLoading()
                ],
              )));
        }));
  }

  @override
  LoginViewModel init_my_view_model() {
    OTPService otpService = OTPService();
    OTPRepo otpRepo = OTPRepo(otpService);
    return LoginViewModel(otpRepo);
  }

  @override
  onError(String message) {
    return error_widget(context: context, message: message);
  }

  @override
  LoadingWidget showLoading() {
    return const LoadingWidget();
  }

  @override
  navigateToVerify() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const VerifyOTPNumberScreen(),
      ),
    );
  }
}
