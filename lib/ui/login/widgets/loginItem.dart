import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';
import '../../../routing/appRoutes.dart';
import '../../core/shared_widget/elevatedButton.dart';
import '../../core/shared_widget/textFormField.dart';

class LoginItem extends StatefulWidget {
  const LoginItem({super.key});

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
                padding: EdgeInsets.all(AppConstants.screenWidth * 0.08),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: AppConstants.screenHeight * 0.02,
                      ),
                      image(),
                      login_text(),
                      SizedBox(
                        height: AppConstants.screenHeight * 0.018,
                      ),
                      textFormField(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          label: "enter your email"),
                      SizedBox(
                        height: AppConstants.screenHeight * 0.03,
                      ),
                      textFormField(
                          prefixIcon: const Icon(Icons.lock, color: Colors.black),
                          isShowText: true,
                          label: "enter your password"),
                      SizedBox(
                        height: AppConstants.screenHeight * 0.03,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: forget_password(),
                      ),
                      SizedBox(
                        height: AppConstants.screenHeight * 0.03,
                      ),
                          elevated_button(
                            loading: isLoading,
                            buttonName: "Login",
                            onPressed: () {
                              print("object");
                              try {
                                throw Exception("This is a test error for Sentry!");
                              } catch (error, stackTrace) {
                                Sentry.captureException(
                                  error,
                                  stackTrace: stackTrace,
                                );
                              }
                              setState(() {

                                isLoading = true;
                                Future.delayed(const Duration(milliseconds: 700)).then((value) {
                                  isLoading = false;
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.bottomNav);
                                });
                              });
                              //Navigator.pushNamed(context, AppRoutes.bottomNavScreen

                            },

                          ),
                          registerText()
                    ])))));
  }

  Widget registerText() => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have account?",
              style: TextStyle(fontSize: AppConstants.screenWidth * 0.04),
            ),
            TextButton(
                onPressed: () {
                  //  Navigator.pushNamed(context, AppRoutes.signUp);
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: AppConstants.screenWidth * 0.04),
                ))
          ],
        ),
      );

  forget_password() {
    return Text(
      textAlign: TextAlign.right,
      "Forget Password ?",
      style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: AppConstants.screenWidth * 0.04),
    );
  }

  login_text() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: AppConstants.screenWidth * 0.09),
        ),
        Text(
          'Please Login to continue',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: AppConstants.screenWidth * 0.04),
        ),
      ],
    );
  }

  image() {
    return Image.asset(
      AppImages.loginImage,
      width: AppConstants.screenWidth,
      height: AppConstants.screenHeight * 0.37,
      fit: BoxFit.fitWidth,

    );
  }

}
