import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manafea/ui/auth/view/loginAdmin/signInWithEmail.dart';
import 'package:manafea/ui/bottomNav/view/bottomNavAdmin.dart';

import '../../../../data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';

class AutoLoginAdmin extends StatefulWidget {
  const AutoLoginAdmin({super.key});

  @override
  State<AutoLoginAdmin> createState() => _AutoLoginAdminState();
}

class _AutoLoginAdminState extends State<AutoLoginAdmin> {
  bool isLogin = false;
  final box = GetStorage();

  checkUserLogin() async {
    final isAdminLogin = box.read(SharedSharedPreferencesKeys.isAdminLogin) ?? false;
    setState(() {
      isLogin = isAdminLogin == true;
    });

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserLogin();
  }
  @override
  Widget build(BuildContext context) {
    return isLogin ? BottomNavAdmin() : SingInAdmin();
  }
}
