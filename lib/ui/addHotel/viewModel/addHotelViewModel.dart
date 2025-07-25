import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/hotelModels/addHotel.dart';
import 'package:manafea/ui/addHotel/connector/addHotelConnector.dart';

import '../../../data/repositories/addActivityRepo/addActivityToSubabaseRepo.dart';
import '../../../data/repositories/addActivityRepo/imagePickerRepo.dart';

class AddHotelViewModel extends BaseViewModel<AddHotelConnector> {
  File? _image;
  bool _isLoading = false;
  String? imageUrl;

  bool get isLoading => _isLoading;

  File? get image1 => _image;
  ImagePickerRepo imagePickerRepo;
  AddItemInServiceTableToSupabseRepo addHotel;

  AddHotelViewModel(this.imagePickerRepo, this.addHotel);

  String? get location => _location;
  String? _location;

  changeLocation(String locationName, String d) {
    _location = locationName;
    notifyListeners();
  }

  Future<dynamic> pickImage() async {
    try {
      _image = await imagePickerRepo.pickImage();
      notifyListeners();

    }catch(e){
      connector!.onError("يرجى اختيار الصورة");
    }
  }

  Future<String?> uploadImage() async {
    try {
      if (_image == null) throw Exception("No image selected");
      return await imagePickerRepo.uploadImage(_image!,"hotels.images");
    } catch (e) {
      return connector?.onError(e.toString());
    }
  }

  Future addHotelToSupabase(AddHotelModel hotelModel) async {
    setLoading(true);
    try {
      imageUrl = await uploadImage();
      if (imageUrl == null || imageUrl!.contains("Exception")) {
        setLoading(false);
        return; // أوقف العملية فورًا
      }
      print("image Url $imageUrl");// ← هنا بناخد رابط الصورة
      final hotel = AddHotelBuilder()
          .setItemDescription(hotelModel.itemDescription)
          .setCommonRoomPricing(
              int.parse(hotelModel.commonRoomPricing.toString()))
          .setItemName(hotelModel.itemName)
          .setItemImageUrl(imageUrl.toString())
      .setGoogleMapsUrl(hotelModel.googleMapsUrl)
          .setSpecialRoomPricing(
              int.parse(hotelModel.specialRoomPricing.toString()))
          .setItemAddress(hotelModel.itemAddress)
          .setCountry(_location.toString())
          .build();
      await addHotel.addItemInService(hotel, 'hotels');
      _image = null;
      _location = null;
      setLoading(false);
      return connector?.successWidget();
    } catch (e) {
      print("error occur ${e.toString()}");
      setLoading(false);
      return connector!.onError(e.toString());
    }
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
