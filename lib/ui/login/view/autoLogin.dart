import 'package:flutter/cupertino.dart';
import 'package:manafea/ui/bottomNav/view/bottomNav.dart';
import 'package:manafea/ui/login/view/personalDetailedView.dart';

import '../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import '../../onBoard/view/onBoardingScreen.dart';

class AutoLogin extends StatefulWidget {
  const AutoLogin({super.key});

  @override
  State<AutoLogin> createState() => _AutoLoginState();
}

class _AutoLoginState extends State<AutoLogin> {
  bool isLogin = false;
  bool isAddName = false;
  bool isLoading = true;

  checkUserLogin() async {
    final userId = await SharedPreferencesHelper.getData(SharedSharedPreferencesKeys.userId);
    final firstName = await SharedPreferencesHelper.getData(SharedSharedPreferencesKeys.firsName);
print(userId);
print("user");
    setState(() {
      isLogin = userId != null;
      isAddName = firstName != null;
      isLoading = false;
    });

    print("login $isLogin");
    print("is add $isAddName");
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

    return isLogin && isAddName
        ? const BottomNav()
        : isLogin
        ? PersonalDetailedScreen()
        : Onboardingscreen();
  }
}
