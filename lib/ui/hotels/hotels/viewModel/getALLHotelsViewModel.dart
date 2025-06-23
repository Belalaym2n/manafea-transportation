import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/base_class.dart';
 import 'package:manafea/generated/locale_keys.g.dart';

 import '../../../../data/repositories/hotels/getALLHotelsRepo.dart';
import '../../../../domain/models/hotelModels/addHotel.dart';
 import '../connector/getHotelsConnector.dart';

class GetAllHotelViewModel extends BaseViewModel<GetHotelsConnector> {
  static GetAllHotelViewModel? _instance;

  static GetAllHotelViewModel getInstance(GetAllHotelsRepo getAllHotelsRepo) {
    _instance ??= GetAllHotelViewModel._internal(getAllHotelsRepo);
    return _instance!;
  }

  GetAllHotelViewModel._internal(this.getAllHotelsRepo);
  bool _isDataLoadedFirst = false;

  bool get isDataLoadedFirst => _isDataLoadedFirst;

   List<AddHotelModel> hotels = [];
  List<AddHotelModel> filterHotels = [];
  String? _country;

  bool isSearchPressed = false;

  String? get country => _country;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _countryLanguage;

  String? get countryLanguage => _countryLanguage;

  changeCountry(String countryName, String countryNameWithLanguage) {
    _country = countryName;
    _countryLanguage = countryNameWithLanguage;

    filterHotelsByCountry(_country!);

    notifyListeners();
  }

  GetAllHotelsRepo getAllHotelsRepo;

  getHotels() async {
    if(_isDataLoadedFirst){
      return;
    }
    setLoading(true);
    try {
      hotels = await getAllHotelsRepo.getHotels();
      _isDataLoadedFirst=true;
      notifyListeners();
      setLoading(false);
    } catch (e) {
      setLoading(false);

      print("Error ${e.toString()}");
      connector!.onError(LocaleKeys.errors_something_went_wrong.tr());
    }
  }

  void filterHotelsByCountry(String country) {
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

    return connector!.showDataWidget(filterHotels);
  }

  Widget showRecommendedHotel() {
    if (_isLoading == true) {
      return connector!.showLoading();
    }
    if (hotels.isEmpty) {
      return connector!.emptyDataWidget();
    } else {
      return connector!.showDataWidget(hotels);
    }
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
