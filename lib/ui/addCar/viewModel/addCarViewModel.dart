import 'dart:io';

import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/carModels/addCarModel.dart';

import '../../../data/repositories/addActivityRepo/addActivityToSubabaseRepo.dart';
import '../../../data/repositories/addActivityRepo/imagePickerRepo.dart';

class AddCarViewModel extends BaseViewModel{
  File? _image;
  bool _isLoading = false;
  String? imageUrl;

  bool get isLoading => _isLoading;

  File? get image1 => _image;
  ImagePickerRepo imagePickerRepo;

  AddItemInServiceTableToSupabseRepo addCar;
  AddCarViewModel(this.imagePickerRepo,this.addCar);

  String? get location => _location;
  String? _location;
  changeLocation(String locationName) {
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
  Future addCarToSupabase(String name, String description,
      String pricing) async {
    setLoading(true);
    try {
      imageUrl = await uploadImage(); // ← هنا بناخد رابط الصورة
      notifyListeners();

      if (imageUrl == null) throw Exception("Image upload failed");

      final car = CarBuilder()
          .setItemName(name)
          .setItemDescription(description)
          .setItemImageUrl(imageUrl!) // ✅ بعد رفع الصورة
          .setItemPricing(int.parse(pricing)) // pricing تصحيح هنا برضو
          .build();

      await addCar.addItemInService(car, 'Cars');
      setLoading(false);

      _image = null;
      imageUrl = null; // كمان نصفر الurl بعد ما نخلص
      notifyListeners();
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