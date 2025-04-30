import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/hotels/hotels/connector/getHotelsConnector.dart';
import 'package:manafea/ui/hotels/hotels/viewModel/getALLHotelsViewModel.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../../config/appConstants.dart';
import '../../../../data/repositories/hotels/getALLHotelsRepo.dart';
import '../../../../data/services/hotels/getAllHotelsSupabaseService.dart';
import '../../../core/commonScreen/buildHeaderForChooseSpecificaLocation.dart';

class FilterHotels extends StatefulWidget {
  const FilterHotels({super.key});

  @override
  State<FilterHotels> createState() => _FilterHotelsState();
}

class _FilterHotelsState extends BaseView<GetAllHotelViewModel
,FilterHotels> implements GetHotelsConnector{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getHotels();
    viewModel.connector=this;
  }

  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer
        <GetAllHotelViewModel>(
        builder: (context, value, child) =>
        BuildHeaderForChooseSpecificLocation(

      questionText:
      Text(
        "Where do you want to hotel booking from?",
        style: TextStyle(
            fontSize: AppConstants.screenWidth * 0.045,
            fontWeight: FontWeight.bold), // حجم الخط بناءً على العرض
      )
      ,
      changeSearchBool: value.changeSearchBool,
      getServiceItems: value.showSpecificHotels,
      isSearchPressed: value.isSearchPressed,
      changeLocation: value.changeLocation,
      location: value.country,
    )));
  }

  @override
  emptyDataWidget() {
    // TODO: implement emptyDataWidget
    return Text("empty");
  }

  @override
  GetAllHotelViewModel init_my_view_model() {
    GetAllHotelsSupabaseService getAllHotelsSupabaseService=
    GetAllHotelsSupabaseService()
    ;

    GetAllHotelsRepo getAllHotelsRepo=
    GetAllHotelsRepo(getAllHotelsSupabaseService);
    // TODO: implement init_my_view_model
    return GetAllHotelViewModel(getAllHotelsRepo);
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
