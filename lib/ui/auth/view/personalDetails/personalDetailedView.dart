import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/loginDataRepo/loginDataRepo.dart';
import 'package:manafea/data/services/loginDataServie/loginDataService.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';

import 'package:provider/provider.dart';

import '../../../../config/checkNetwork/mainWrapper.dart';
import '../../connector/personalDetailedConnector.dart';
import '../../viewModel/forPersonalDetails/personalDetailedVeiwModel.dart';
import '../../widgets/loadingWidget.dart';
import '../../widgets/personalDetails/userPersonalDetails.dart';

class PersonalDetailedScreen extends StatefulWidget {
  const PersonalDetailedScreen({super.key});

  @override
  State<PersonalDetailedScreen> createState() => _PersonalDetailedScreenState();
}

class _PersonalDetailedScreenState
    extends BaseView<PersonalDetailedViewModel, PersonalDetailedScreen>
    implements PersonalDetailedConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
    viewModel.loadData();  // تأكد من استدعاء الدالة باستخدام الأقواس
  }
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MainWrapper(
        childWidget: ChangeNotifierProvider(
        create: (context) => viewModel,
        builder: (context, child) => Consumer<PersonalDetailedViewModel>(
                builder: (context, view, child) {
              return AbsorbPointer(
                  absorbing: view.isLoading,
                  child: Scaffold(
                    body: Stack(
                      children: [
                         UserPersonalDetailsItem(
                           email: view.email.toString(),
                           uploadUserDat: viewModel
                               .uploadUserToDatabase,
                           phoneNumber:view.phoneNumber,
                           firstNameController: firstNameController,
                              lastNameController: lastNameController,
                         ),
                        if (view
                            .isLoading) // إذا كان في حالة تحميل، عرض الـ loading indicator
                          showLoading()
                      ],
                    ),
                  ));
            })));
  }

  @override
  PersonalDetailedViewModel init_my_view_model() {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    LoginDataService loginDataService = LoginDataService(fireStore);
    LoginDataRepo loginDataRepo = LoginDataRepo(loginDataService);
    // TODO: implement init_my_view_model
    return PersonalDetailedViewModel(loginDataRepo);
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
  navigateToHomeScreen() {
    // TODO: implement navigateToHomeScreen

    return Navigator.pushNamedAndRemoveUntil(context, AppRoutes.bottomNav, (route) => false
      ,);
  }
}
