import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/authRepo/otpRepo.dart';
import 'package:manafea/data/services/OTPServie/otpService.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/connector/loginConnector.dart';
import 'package:manafea/ui/login/viewModel/loginViewModel.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:manafea/ui/login/widgets/userPersonalDetails.dart';
import 'package:manafea/ui/login/widgets/verifyScreen.dart';
import 'package:provider/provider.dart';
import '../../../routing/appRoutes.dart';
import '../widgets/loginItem.dart';

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
  bool _isDialogShowing = false; // متغير لتتبع حالة الـ Dialog

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Stack(
          children: [
            LoginItem(
              sendOTP: () {
                viewModel.sendVerification(number: phoneNumberController.text);
              },
              controller: phoneNumberController,
            ),
        Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (viewModel.isLoading) {
                if (!_isDialogShowing) {
                  _isDialogShowing = true;
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierColor: Colors.black.withOpacity(0.3),
                    builder: (context) => const LoadingWidget(),
                  );
                }
              } else {
                if (_isDialogShowing) {
                  _isDialogShowing = false;
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                }
              }
            });
            return const SizedBox(); // ✅ تجنب كسر البناء
          },
        )
      ],
        ),
      ),
    );
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
  void showLoading() {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.3),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const LoadingWidget();
      },
    );
  }


  @override
  navigateToVerify() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyScreen(verifyNumber: viewModel.verifyNumber),
      ),
    );
  }

  @override
  navigateToPersonalDetailed() {
    return
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserPersonalDetails(
              ),
        ),
      );  }
}
