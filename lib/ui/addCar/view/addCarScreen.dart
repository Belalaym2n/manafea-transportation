import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/addCar/connector/addCarConnector.dart';
import 'package:manafea/ui/addCar/viewModel/addCarViewModel.dart';
import 'package:manafea/ui/addCar/widgets/addCarItem.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../config/appColors.dart';
import '../../../data/repositories/addActivityRepo/addActivityToSubabaseRepo.dart';
import '../../../data/repositories/addActivityRepo/imagePickerRepo.dart';
import '../../../data/services/addActivityService/addActivitySupebaseService.dart';
import '../../../data/services/addActivityService/imagePickerService.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends BaseView<AddCarViewModel, AddCarScreen>
    implements AddCarConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: AbsorbPointer(
            absorbing: viewModel.isLoading,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(
                    ' Add Car',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                ),
                body: Consumer<AddCarViewModel>(
                    builder: (context, value, child) => Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(children: [
                                AddCarItem(
                                    publicUrl: value.imageUrl.toString(),
                                    image: value.image1,
                                    openImage: value.pickImage,
                                    addCar: value.addCarToSupabase)
                              ]),
                            ),
                            if (value.isLoading) // عرض الـ loading indicator
                              showLoading(),
                          ],
                        )))));
  }

  @override
  AddCarViewModel init_my_view_model() {
    ImagePickerService imagePickerService = ImagePickerService();
    ImagePickerRepo imagePickerRepo = ImagePickerRepo(imagePickerService);
    AddItemInServiceTableToSupabase addActivityToSupabase =
        AddItemInServiceTableToSupabase();

    AddItemInServiceTableToSupabseRepo addCar =
        AddItemInServiceTableToSupabseRepo(addActivityToSupabase);
    // TODO: implement init_my_view_model
    return AddCarViewModel(
      imagePickerRepo,
      addCar,
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
