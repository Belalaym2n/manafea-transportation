import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/core/shared_widget/error_widget.dart';
import 'package:manafea/ui/hotels/hotels/connector/getHotelsConnector.dart';
import 'package:manafea/ui/hotels/hotels/viewModel/getALLHotelsViewModel.dart';
import 'package:manafea/ui/login/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../../config/appConstants.dart';
import '../../../../data/repositories/hotels/getALLHotelsRepo.dart';
import '../../../../data/services/hotels/getAllHotelsSupabaseService.dart';
import '../../../activity/widget/getActivitiesScreen/searchResultScreen.dart';
import '../../../core/commonScreen/buildHeaderForChooseSpecificaLocation.dart';
import '../../hotelBooking/view/hotelBookinScreen.dart';

class FilterHotels extends StatefulWidget {
  const FilterHotels({super.key});

  @override
  State<FilterHotels> createState() => _FilterHotelsState();
}

class _FilterHotelsState extends BaseView<GetAllHotelViewModel, FilterHotels>
    implements GetHotelsConnector {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getHotels();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) => Consumer<GetAllHotelViewModel>(
            builder: (context, value, child) =>
                BuildHeaderForChooseSpecificLocation(
                  questionText: Text(
                    LocaleKeys
                        .hotelsScreen_where_do_you_want_to_hotel_booking_from
                        .tr(),
                    style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.045,
                        fontWeight:
                            FontWeight.bold), // حجم الخط بناءً على العرض
                  ),
                  changeSearchBool: value.changeSearchBool,
                  getServiceItems: value.showSpecificHotels,
                  isSearchPressed: value.isSearchPressed,
                  changeLocation: value.changeCountry,
                  location: value.country,
                )));
  }

  @override
  emptyDataWidget() {
    // TODO: implement emptyDataWidget
    return   Center(
      child: Text(
       LocaleKeys.hotelsScreen_noHotelsFound.tr(),
        style:   TextStyle(
          fontSize: AppConstants.screenWidth*0.05,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  GetAllHotelViewModel init_my_view_model() {
    GetAllHotelsSupabaseService getAllHotelsSupabaseService =
        GetAllHotelsSupabaseService();

    GetAllHotelsRepo getAllHotelsRepo =
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
    return const LoadingWidget();
  }

  @override
  showDataWidget(List<AddHotelModel> hotels) {
    // TODO: implement showDataWidget
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // سيارتين في كل صف
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8, // التحكم في أبعاد الودجت
            ),
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              var hotel = hotels[index];

              return SearchResultScreen(
                bookingNav: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HotelBookingScreen(hotelModel: hotel)));
                },
                imageUrl: hotel.itemImageUrl,
                itemName: hotel.itemName,
                location: hotel.itemAddress,
              );
            }));
  }
}
