import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/hotelModels/requestHotelBooking.dart';
import 'package:manafea/ui/hotels/hotelBooking/view/hotelBookinScreen.dart';
import 'package:manafea/ui/hotels/hotels/view/recomendedHotels.dart';
import 'package:manafea/ui/hotels/hotels/widgets/recomendedHotelsItem/recommendedHotelItem.dart';

import '../../../../data/repositories/activity/getActivitySupabseRepo.dart';
import '../../../../data/repositories/hotels/getALLHotelsRepo.dart';
import '../../../../domain/models/hotelModels/addHotel.dart';
import '../../../activity/widget/getActivitiesScreen/searchResultScreen.dart';
import '../connector/getHotelsConnector.dart';

class GetAllHotelViewModel extends BaseViewModel<GetHotelsConnector> {
  List<AddHotelModel> hotels = [];
  List<AddHotelModel> filterHotels = [];
  String? _country;

  bool isSearchPressed = false;

  String? get country => _country;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  changeLocation(String destinationName) {
    _country = destinationName;
    filterOrdersByStatus(_country!);
    print(_country);
    notifyListeners();
  }

  GetAllHotelsRepo getAllHotelsRepo;

  GetAllHotelViewModel(this.getAllHotelsRepo);

  getHotels() async {
    setLoading(true);
    try {
      hotels = await getAllHotelsRepo.getHotels();
      setLoading(false);
    } catch (e) {
      setLoading(false);

      print("Error ${e.toString()}");
      connector!.onError(e.toString());
    }
  }

  void filterOrdersByStatus(String country) {
    filterHotels = hotels.where((hotel) => hotel.country == country).toList();
    notifyListeners();
  }

  changeSearchBool() {
    isSearchPressed = true;
    notifyListeners();
  }

  Widget showSpecificHotels() {
    if (filterHotels.isEmpty) {
      return connector!.emptyDataWidget();
    }

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
                bookingNav: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        HotelBookingScreen(hotelModel: hotel)
                  ));
                },
                imageUrl: hotel.itemImageUrl,
                itemName: hotel.itemName,
                location: hotel.itemAddress,
              );
            }));
  }

  Widget showRecommendedHotel() {
    if (_isLoading == true) {
      return connector!.showLoading();
    }
    if (hotels.isEmpty) {
      return connector!.emptyDataWidget();
    } else {
      return RecommendedHotelItem(
        hotels: hotels,
      );
    }
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
