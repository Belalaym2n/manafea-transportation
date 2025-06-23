import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/data/repositories/hotels/getALLHotelsRepo.dart';
import 'package:manafea/data/services/hotels/getAllHotelsSupabaseService.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/hotels/hotels/viewModel/getALLHotelsViewModel.dart';
import 'package:manafea/ui/hotels/hotels/widgets/recomendedHotelsItem/recommendedHotelItem.dart';
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
    print("h ${AppConstants.screenHeight}");
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
        builder: (context, value, child) =>   SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              serviceName(name: LocaleKeys.home_screen_recommended_hotels.tr()),
          SizedBox(height: AppConstants.screenHeight * 0.01),
               SizedBox(
                 height: AppConstants.screenHeight*0.29,
                 child: 
               viewModel.showRecommendedHotel())
              ]),
        ),
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
    return GetAllHotelViewModel.getInstance(getAllHotelsRepo);
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
        .setItemImageUrl("https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a"// ✅ بعد رفع الصورة
    )
    .build();
    // TODO: implement showLoading
    return

      Skeletonizer(child: RecommendedHotelItem(
          hotels: [
      model,
      model,
    ]));
  }

  @override
  emptyDataWidget() {
    // TODO: implement emptyDataWidget
    return const Text("empty");
  }

  @override
  showDataWidget(List<AddHotelModel> hotels) {
    // TODO: implement showDataWidget
 return   RecommendedHotelItem(
      hotels: hotels,
    );
  }
}
