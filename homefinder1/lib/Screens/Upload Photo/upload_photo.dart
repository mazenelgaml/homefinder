
// ignore_for_file: unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Upload%20Preview/upload_preview.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'dart:typed_data' show Uint8List;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../utilities/memory.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (source != null) {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();

        setState(() {
          _imageBytes = bytes;
        });

        // Navigate to UploadPreview page immediately after picking the image
        Get.to(() => UploadPreview(imageBytes: _imageBytes!));
      }
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      print('No image selected.');
      return;
    }

    // Convert the image to a file
    File imageFile = File(image.path);

    // Retrieve authorization token
    String? token =  Get.find<StorageService>().getToken;
    if (token == null) {
      print('Authorization token is null.');
      return;
    }

    // Prepare the upload request
    var request = http.MultipartRequest('POST', Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/user/upload-image'));

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    request.headers['Authorization'] = token;

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');
        Get.to(() => UploadPreview(imageBytes: _imageBytes!));
      } else {
        // If the status code is not success, show the error in CoolAlert
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Error",
          text: response.reasonPhrase,
        );
      }
    } catch (e) {
      // If an exception occurs, show the error in CoolAlert
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: "$e",
      );
      print('Error occurred while uploading image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomArrowBack(),
        leadingWidth: Get.width * 0.2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Upload Your Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const Row(
              children: [
                Text(
                  "     Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "  This data will be displayed in your account profile ",
              style: TextStyle(fontSize: 15),
            ),
            const Row(children: [
              Text("      for security", style: TextStyle(fontSize: 15)),
            ]),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  height: 135,
                  width: Get.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0, 0),
                        blurRadius: 15,
                      ),
                    ],
                    color: const Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(

                      color: const Color(0xffF4F4F4),
                      width: 3,
                    ),
                  ),

                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("lib/assets/images/Gallery123.png")),
                        Text(
                          "From Gallery",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if (_imageBytes != null) {
                    Get.to(() => UploadPreview(imageBytes: _imageBytes!));
                  } else {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      title: "Error",
                      text: "No image selected",
                    );
                  }
                },
                child: const Row(
                  children: [
                    Text(
                      "          Next",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.navigate_next, size: 30),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
            ),
            TextButton(


              onPressed: () {
                Get.to(()=>HomeScreen());
              },
              child: const Text(


                "skip now",
                style: TextStyle(color: Color(0xff6C63FF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
