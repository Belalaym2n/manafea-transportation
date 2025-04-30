import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/hotels/getALLHotelsRepo.dart';
import 'package:manafea/data/services/hotels/getAllHotelsSupabaseService.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/hotels/hotels/viewModel/getALLHotelsViewModel.dart';
import 'package:manafea/ui/hotels/hotels/widgets/recomendedHotelsItem/recommendedHotelItem.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/appConstants.dart';
import '../../../home/widgets/serviceName.dart';
import '../connector/getHotelsConnector.dart';

class RecommendedHotels extends StatefulWidget {
  const RecommendedHotels({super.key});

  @override
  State<RecommendedHotels> createState() => _RecommendedHotelsState();
}

class _RecommendedHotelsState extends BaseView<GetAllHotelViewModel
,RecommendedHotels> implements GetHotelsConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;
     viewModel.getHotels();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<GetAllHotelViewModel>(
        builder: (context, value, child) =>   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            serviceName(name: '#RecommendedHotels'),
        SizedBox(height: AppConstants.screenHeight * 0.01),

            viewModel.showRecommendedHotel()
            ]),
      ),
    )
     ;
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
    final model=
        AddHotelBuilder().setItemAddress("address")
    .setItemName("name")
    .build();
    // TODO: implement showLoading
    return

      Skeletonizer(child: RecommendedHotelItem(hotels: [
      model,
      model,
    ]));
  }

  @override
  emptyDataWidget() {
    // TODO: implement emptyDataWidget
    return Text("empty");
  }
}
