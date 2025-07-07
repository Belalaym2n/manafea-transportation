import 'package:flutter/cupertino.dart';
import 'package:manafea/ui/auth/view/personalDetails/personalDetailedView.dart';
import 'package:manafea/ui/auth/view/withEmail/verifyScreen.dart';
import 'package:manafea/ui/bottomNav/view/bottomNav.dart';

import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../onBoard/view/onBoardScreen.dart';

class AutoLogin extends StatefulWidget {
  const AutoLogin({super.key});

  @override
  State<AutoLogin> createState() => _AutoLoginState();
}

class _AutoLoginState extends State<AutoLogin> {
  bool userID = false;
  bool isLoginWithEmail = false;
  bool isCreatedAccount = false;
  bool isAddName = false;
   bool isLoading = true;

  checkUserLogin() async {
    final userId = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.userId);
    final signIn = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.signInWithEmail);
    final isCreatedAcc = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.isCreatedAccount);
    final firstName = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.firsName);

    print("user  id $userId");
    print("isCreatedAccount  id $isCreatedAcc");
    print("isCreatedAccount    $signIn");
    setState(() {
      userID = userId != null;
      isLoginWithEmail = signIn != null;
      isCreatedAccount = isCreatedAcc != null;
      isAddName = firstName != null;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CupertinoActivityIndicator(); // أو أي لودينج ويدجت يعجبك
    }

    return
 // create acc and verify
      isCreatedAccount && userID && !isAddName ||
          // just verify phone number
          // user id if login with phone
            !isCreatedAccount && userID && !isAddName &&isLoginWithEmail==false
        ? const PersonalDetailedScreen()

      // verify number and set data || login  With email
        : userID && isAddName ||userID && isLoginWithEmail
            ? const BottomNav():
          // create acc and not verify
      isCreatedAccount?const VerifyEmailScreen()
            :   OnBoardScreen();
  }
}
