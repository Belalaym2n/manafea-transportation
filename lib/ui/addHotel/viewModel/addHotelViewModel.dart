import 'dart:io';

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
  AddHotelViewModel(this.imagePickerRepo,this.addHotel);

  String? get location => _location;
  String? _location;
  changeLocation(String locationName,String d) {
    _location = locationName;
    notifyListeners();
  }

  Future<dynamic> pickImage() async {
    try {
      _image = await imagePickerRepo.pickImage();
      notifyListeners();
    } catch (e) {
      connector!.onError(e.toString());
      rethrow;
    }
  }
  Future<String?> uploadImage() async {
    try {
      if (_image == null) throw Exception("No image selected");
      return await imagePickerRepo.uploadImage(_image!);
    } catch (e, stacktrace) {
      print("Upload error: ${e.toString()}");
      print("Stacktrace: $stacktrace"); // 👈 مهم جداً
      return connector?.onError(e.toString());
    }
  }

  Future addHotelToSupabase(AddHotelModel hotel) async {
    setLoading(true);
    try {
      imageUrl = await uploadImage(); // ← هنا بناخد رابط الصورة
      notifyListeners();
      print(_image);
      print(imageUrl);
      await addHotel.addItemInService(hotel,'hotels');
      setLoading(false);
      print("Activity added successfully");
      _image = null;
      print(_image);
      print(imageUrl);
      // return connector!.successWidget();
    } catch (e) {
      print("error ${e.toString()}");
      setLoading(false);
      return connector!.onError(e.toString());
    }
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
