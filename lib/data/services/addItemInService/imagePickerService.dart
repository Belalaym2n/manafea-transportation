import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();
  final supabase = Supabase.instance.client;

  Future<File> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 1920,
      maxWidth: 1080,
    );

    if (pickedFile == null) throw Exception("No image selected");

    final file = File(pickedFile.path);
    return file;
  }

  Future<String> uploadImageToSupabase(File file, String imagesFile) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();

      final storageResponse = await supabase.storage
          .from(imagesFile)
          .upload('public/$fileName.jpg', file);
//
      print("Upload response: $storageResponse");

      final publicUrl = supabase.storage
          .from('activities.images')
          .getPublicUrl('public/$fileName.jpg');

      return publicUrl;
    } catch (E) {
      print("error ${E.toString()}");
      return throw Exception("error to upload image");
    }
  }
}
