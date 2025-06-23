import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/auth/viewModel/forEmail/signInViewModel.dart';
import 'package:manafea/ui/auth/widgets/loadingWidget.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../../config/appConstants.dart';
import '../../../../data/repositories/authRepo/forEmail/signInRepo.dart';
import '../../../../data/services/Auth/withEmail/signIn.dart';
import '../../connector/signInConnector.dart';
import '../../widgets/forEmail/forget_password.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends BaseView<SignInViewModel,ForgetPassword>
    implements
SignInConnector {
TextEditingController email = TextEditingController();


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
      builder: (context, child) => Consumer<SignInViewModel>(
        builder: (context, value, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              ForgetPasswordItem(
                forgetPassword: value.resetPassword ,
             email: email,
              ),
              if (value.isLoading) showLoading()
            ],
          ),
        ),
      ));
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
    return const LoadingWidget();
  }

  @override
  navigateToHome() {
    // TODO: implement navigateToHome
    throw UnimplementedError();
  }

  @override
  showSuccessMessage(String message) {
    // TODO: implement showSuccessMessage
    return   showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Icon(Icons.check_circle_outline, color: Colors.green, size: 48),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppConstants.screenWidth * 0.09),
                ),
                minimumSize: Size(AppConstants.screenWidth * 0.16,
                    AppConstants.screenHeight * 0.04),
                shadowColor: Colors.red.withOpacity(0.5),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.buttons_name_ok.tr(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
