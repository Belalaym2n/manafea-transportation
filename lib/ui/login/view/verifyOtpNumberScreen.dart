import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/connector/loginConnector.dart';
import 'package:manafea/ui/login/connector/verifyConnector.dart';
import 'package:manafea/ui/login/view/personalDetailedView.dart';
import 'package:manafea/ui/login/viewModel/loginViewModel.dart';
import 'package:manafea/ui/login/widgets/verifyScreen.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/authRepo/otpRepo.dart';
import '../../../data/services/OTPServie/otpService.dart';
import '../viewModel/verifyViewModel.dart';
import '../widgets/loadingWidget.dart';
import '../widgets/userPersonalDetails.dart';

class VerifyOTPNumberScreen extends StatefulWidget {
  const VerifyOTPNumberScreen({super.key});

  @override
  State<VerifyOTPNumberScreen> createState() => _VerifyOTPNumberScreenState();
}

class _VerifyOTPNumberScreenState
    extends BaseView<VerifyViewModel, VerifyOTPNumberScreen>
    implements VerifyConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        builder: (context, child) =>
            Consumer<VerifyViewModel>(builder: (context, view, child) {
              return AbsorbPointer(
                  absorbing: view.isLoading,
                  child: Scaffold(
                    body: Stack(
                      children: [
                        VerifyScreen(verifyNumber: viewModel.verifyNumber),
                        if (view
                            .isLoading) // إذا كان في حالة تحميل، عرض الـ loading indicator
                          showLoading()
                      ],
                    ),
                  ));
            }));
  }

  @override
  VerifyViewModel init_my_view_model() {
    OTPService otpService = OTPService();
    OTPRepo otpRepo = OTPRepo(otpService);
    return VerifyViewModel(otpRepo);
  }

  @override
  navigateToPersonalDetailed() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PersonalDetailedScreen(),
      ),
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
    return LoadingWidget();
  }
}
