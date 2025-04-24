import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/addActivityRepo/addActivityToSubabaseRepo.dart';
import 'package:manafea/data/repositories/addActivityRepo/imagePickerRepo.dart';
import 'package:manafea/data/services/addActivityService/addActivitySupebaseService.dart';
import 'package:manafea/data/services/addActivityService/imagePickerService.dart';
import 'package:manafea/ui/addActivity/connector/addActivityConnector.dart';
import 'package:manafea/ui/addActivity/viewModel/addActivityViewModel.dart';
import 'package:manafea/ui/addActivity/widgets/successWidget.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../config/appColors.dart';
import '../widgets/addActivityAitem.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends BaseView<AddActivityViewModel,
    AddActivity>
    implements AddActivityConnector {
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
        child:  AbsorbPointer(
        absorbing: viewModel.isLoading,
        child:Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('إضافة نشاط جديد',style: TextStyle(
            color:AppColors.primaryColor
        ),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:Consumer<AddActivityViewModel>(
          builder: (context, value, child) =>Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              AddActivityItem(
                publicUrl: value.imageUrl.toString(),
                image: value.image1 ,
                addActivity:
                    value.addActivity,
                openImage: value.pickImage,
              ),
            ],
          ),
        ),

        if (value.isLoading) // عرض الـ loading indicator
          showLoading(),
      ],)
        ))));
  }

  @override
  AddActivityViewModel init_my_view_model() {
    ImagePickerService imagePickerService = ImagePickerService();
    ImagePickerRepo imagePickerRepo = ImagePickerRepo(imagePickerService);
    AddActivityToSupabaseService addActivityToSupabaseService=AddActivityToSupabaseService();

  AddActivityToSupabseRepo addActivityToSupabseRepo
  =AddActivityToSupabseRepo(addActivityToSupabaseService);

    // TODO: implement init_my_view_model
    return AddActivityViewModel(imagePickerRepo,addActivityToSupabseRepo);
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
  successWidget() {
    // TODO: implement successWidget
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(
          seconds: 2
        ),
        content: Text("تمت الإضافة بنجاح"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
