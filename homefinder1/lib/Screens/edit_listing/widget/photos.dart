import 'dart:convert';
import 'dart:typed_data';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing/add_listing_screen.dart';
import 'package:homefinder1/Screens/editi_listing_first_deatil_screen/edit_listing_first_detail_screen.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../utilities/memory.dart';

class ImagePickerExample1 extends StatefulWidget {
  final String residenceId;
  ImagePickerExample1(this.residenceId);
  @override
  _ImagePickerExampleState1 createState() => _ImagePickerExampleState1();
}

class _ImagePickerExampleState1 extends State<ImagePickerExample1> {
  List<Uint8List> _images = [];

  Future<void> _pickImagesFromGallery() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles != null) {
      for (var pickedFile in pickedFiles) {
        Uint8List bytes = await pickedFile.readAsBytes();
        setState(() {
          _images.add(bytes);
        });
      }
    } else {
      print('No images selected.');
    }
  }

  Future<void> _pickImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _images.add(bytes);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _showImagePickerDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImagesFromGallery();
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImageFromCamera();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> uploadImage(BuildContext context) async {
    if (_images.isEmpty) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        title: "Warning",
        text: "Please select at least one image to upload.",
      );
      return;
    }

    // Replace with your actual API endpoint
    final String apiUrl = 'https://home-finder-back-end-i7ca.onrender.com/api/v1/residence/upload/${widget.residenceId}'; // Example URL

    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      String? token = await Get.find<StorageService>().getToken;
      if (token == null) {
        print('Authorization token is null.');
        return;
      }
      // Add images to the request
      for (var image in _images) {
        request.files.add(http.MultipartFile.fromBytes('images', image, filename: 'image.jpg'));
      }
      request.headers['Authorization'] = token;

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');

        // Navigate to the next screen on success, passing necessary data
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => EditListingFirstDetailScreen(residanceId: widget.residenceId),
        ));
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Error",
          text: "Failed to upload images. Status code: ${response.reasonPhrase}",
        );
      }
    } catch (e) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: "An error occurred: $e",
      );
      print('Error uploading images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        leadingWidth: Get.width * 0.2,
        leading: CustomArrowBack(),
        title: Text(
          'Add Listing',
          style: TextStyle(
              color: kDarkBlueColor,
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontFamily: kRegularFont),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  Add",
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            fontFamily: kRegularFont)),
                    Text(" photos",
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            fontFamily: kRegularFont)),
                    Text(" to your",
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            fontFamily: kRegularFont)),
                  ],
                ),
                Text("   listing",
                    style: TextStyle(
                        color: kDarkBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        fontFamily: kRegularFont)),
              ],
            ),
            _images.isEmpty
                ? Center(child: Text('No images selected.'))
                : Container(
              height: Get.height * 0.55,
              width: Get.width,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(_images.length, (index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 4, left: 4, top: 5),
                        width: 159,
                        height: 161,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.memory(
                            _images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _images.removeAt(index);
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xff9292FD),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _showImagePickerDialog,
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 100),
                    backgroundColor: kVeryLightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: kDarkBlueColor,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 210,
                height: 64,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(color: kPrimaryColor, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: kRegularFont,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      uploadImage(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        fixedSize: Size(200, 70))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
