import 'dart:io';

 import '../../services/addItemInService/imagePickerService.dart';

class ImagePickerRepo {
  ImagePickerService imagePickerService;
  ImagePickerRepo(this.imagePickerService);

 Future<File> pickImage() async {
    try{
      return await  imagePickerService.pickImage();
    }catch(E){
      throw Exception(E.toString());
    }
  }

  Future<String> uploadImage(File file,String imagesFile) async {
    try {
      return await imagePickerService.uploadImageToSupabase(file,imagesFile);
    } catch (e) {
      throw Exception("Upload failed: ${e.toString()}");
    }
  }



}