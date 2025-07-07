import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:manafea/config/base_class.dart';
import 'package:manafea/domain/models/activityModel/activityModel.dart';
import 'package:manafea/ui/addActivity/connector/addActivityConnector.dart';

import '../../../data/repositories/addActivityRepo/addActivityToSubabaseRepo.dart';
import '../../../data/repositories/addActivityRepo/imagePickerRepo.dart';

class AddActivityViewModel extends BaseViewModel<AddActivityConnector> {
  File? _image;
  String? imageUrl;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  File? get image1 => _image;
  ImagePickerRepo imagePickerRepo;
  AddItemInServiceTableToSupabseRepo addActivityToSupabseRepo;
  String? _destination; // في الأول = null

  String? get destination => _destination;
  String? _destinationLanguage;

  String? get destinationLanguage => _destinationLanguage;

  AddActivityViewModel(this.imagePickerRepo, this.addActivityToSupabseRepo);

  changeDestination(String destinationName, String destinationWithLanguage) {
    _destination = destinationName;
    _destinationLanguage = destinationName;
    print(_destination);
    notifyListeners();
  }

  Future<dynamic> pickImage() async {
    try {
      _image = await imagePickerRepo.pickImage();
      notifyListeners();
    } catch (e) {
      connector!.onError("يرجى اختيار الصورة");
    }
  }

  Future<String?> uploadImage() async {
    try {
      if (_image == null) throw Exception("No image selected");
      return await imagePickerRepo.uploadImage(_image!, "activities.images");
    } catch (e, stacktrace) {
      return connector?.onError(e.toString());
    }
  }

  Future addActivity(ActivityModel activityModel) async {
    setLoading(true);
    try {
      imageUrl = await uploadImage(); // ← هنا بناخد رابط الصورة

      if (imageUrl == null) throw Exception("Image upload failed");

      final activity = ActivityModelBuilder()
          .setName(activityModel.itemName)
          .setAddress(activityModel.itemAddress)
          .setDescription(activityModel.itemDescription)
          .setImageUrl(imageUrl.toString())
          .setDestination(_destination.toString())
          .setPricing(int.parse(activityModel.itemPricing.toString()))
          .build();

      await addActivityToSupabseRepo.addItemInService(activity, 'activities');

      _destination = null;
      setLoading(false);
      _image = null;
      return connector!.successWidget();
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
