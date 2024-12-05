// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../utilities/memory.dart';

class ImageUploadService {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickAndUploadImage() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      print('No image selected.');
      return;
    }

    // Convert the image to a file
    File imageFile = File(image.path);

    // Prepare the upload request
    var request = http.MultipartRequest('POST', Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/user/upload-image'));

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
    request.headers['Authorization'] =   Get.find<StorageService>().getToken;
    request.fields['id'] = Get.find<StorageService>().getId ;

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');
      } else {
        print('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while uploading image: $e');
    }
  }
}