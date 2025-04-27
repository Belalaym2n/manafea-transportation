import 'dart:io';

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

  AddActivityViewModel(this.imagePickerRepo, this.addActivityToSupabseRepo);

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

  Future addActivity(ActivityModel activity) async {
    setLoading(true);
    try {
      imageUrl = await uploadImage(); // ← هنا بناخد رابط الصورة
      notifyListeners();
       print(_image);
      print(imageUrl);
      await addActivityToSupabseRepo.addItemInService(activity,'activities');
      setLoading(false);
      print("Activity added successfully");
       _image = null;
      print(_image);
      print(imageUrl);
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
