import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/addHotel/connector/addHotelConnector.dart';
import 'package:manafea/ui/addHotel/viewModel/addHotelViewModel.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../config/appColors.dart';
import '../../../data/repositories/addActivityRepo/addActivityToSubabaseRepo.dart';
import '../../../data/repositories/addActivityRepo/imagePickerRepo.dart';
import '../../../data/services/addItemInService/addItemInService.dart';
import '../../../data/services/addItemInService/imagePickerService.dart';
import '../../../data/services/addItemInService/addItemInService.dart';
import '../../../data/services/addItemInService/imagePickerService.dart';
import '../widget/addHotelWidgetItem.dart';

import 'package:manafea/ui/auth/widgets/loadingWidget.dart';

class AddHotel extends StatefulWidget {
  const AddHotel({super.key});

  @override
  State<AddHotel> createState() => _AddHotelState();
}

class _AddHotelState extends BaseView<AddHotelViewModel, AddHotel>
    implements AddHotelConnector {
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
        child: AbsorbPointer(
            absorbing: viewModel.isLoading,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: const Text(
                    'إضافة فندق',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                ),
                body: Consumer<AddHotelViewModel>(
                    builder: (context, value, child) => Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  AddHotelItem(
                                    publicUrl: value.imageUrl.toString(),
                                    image: value.image1,
                                    openImage: value.pickImage,
                                    addHotel: value.addHotelToSupabase,
                                    selectedLocation: value.location,
                                    changeLocation: value.changeLocation,
                                  ),
                                ],
                              ),
                            ),
                            if (value.isLoading) // عرض الـ loading indicator
                              showLoading(),
                          ],
                        )))));
  }

  @override
  AddHotelViewModel init_my_view_model() {
    ImagePickerService imagePickerService = ImagePickerService();
    ImagePickerRepo imagePickerRepo = ImagePickerRepo(imagePickerService);
    AddItemInServiceTableToSupabase addActivityToSupabaseService =
        AddItemInServiceTableToSupabase();

    AddItemInServiceTableToSupabseRepo addHotel =
        AddItemInServiceTableToSupabseRepo(addActivityToSupabaseService);

    // TODO: implement init_my_view_model
    return AddHotelViewModel(imagePickerRepo, addHotel);
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
        duration: Duration(seconds: 2),
        content: Text("تمت الإضافة بنجاح"),
        backgroundColor: Colors.green,
      ),
    );
  }
}

