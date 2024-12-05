// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, depend_on_referenced_packages, avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/profile/controller/profile_controller.dart';
import 'package:homefinder1/Screens/settings/controller/settings_controller4.dart';

import '../../../models/delete_account_photo_model.dart';
import '../../../models/get_user_model.dart'as dd;
import '../../../models/update_profile_data_model.dart' as uu;
import '../../../services/auth_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../utilities/memory.dart';

class EditProfileController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    getdata();
    bool test4 = Get.isRegistered<SettingsController>();
    if(test4){
      Get.delete<SettingsController>();
    }

  }
  bool test4 = Get.isRegistered<SettingsController>();
  @override
  void onReady() {
    super.onReady();
    getdata();
    if(test4){
      Get.delete<SettingsController>();
    }
  }

  Uint8List? imageBytes;
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final firtNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final genderController = TextEditingController();
  bool validate = false;
  dd.User? data ;
  dd.GetUserModel? data1;
  bool isLoading=true;


  getdata() async
  {
    isLoading=true;
     dd.GetUserModel? response = await AuthServices.fetchUserData();

    if (response == null) {
      print("some error occured");
    } else {
      data= response.user;
      data1=response;
      firtNameController.text=data?.firstName??"";
      lastNameController.text=data?.lastName??"";
      usernameController.text=data?.username??"";
      phoneNumberController.text=data?.phone??"";
      genderController.text=data?.gender??"";

    }

    isLoading = false;

    update();


  }
  Future<void> pickImage(BuildContext context) async {
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


        imageBytes = bytes;
        isLoading=true;

        update();
        // Navigate to UploadPreview page immediately after picking the image
        uploadImage(context, bytes);
      }
    }
  }
  Future<void> uploadImage(BuildContext context, Uint8List imageBytes) async {
    // Convert the image bytes to a file
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    await file.writeAsBytes(imageBytes);

    // Retrieve authorization token
    String? token = Get.find<StorageService>().getToken;
    if (token == null) {
      print('Authorization token is null.');
      return;
    }

    // Prepare the upload request
    var request = http.MultipartRequest('POST', Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/user/upload-image'));

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers['Authorization'] = token;

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');
        update();
        isLoading=true;
        getdata();
        isLoading=false;
        update();
        bool test4 = Get.isRegistered<ProfileController>();
        if(test4){
          Get.delete<SettingsController>();
          Get.delete<ProfileController>();
        }


      } else {
        // If the status code is not success, show the error in CoolAlert
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title:"Error",
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
  Future<void> editProfile(BuildContext context) async {
    try {
      uu.UpdateProfileDataModel? data = await AuthServices.updateProfileData(
          firtNameController.text,
          lastNameController .text,
          genderController.text,
          phoneNumberController.text,
          usernameController.text,
          context
      );
      if (data?.status == "success") {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "Done",
          text: data?.message,
        );
        bool test4 = Get.isRegistered<ProfileController>();
        if(test4){
          Get.delete<SettingsController>();
          Get.delete<ProfileController>();
        }

      }
    } catch (e) {
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: part,
      );
    }

  }
  Future<void> deleteUsrPhoto(BuildContext context) async {
    try {
      DeleteAccountPhotoModel? data = await AuthServices.deleteAccountPhoto(context);
      if (data?.status == "success") {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "done",
          text: data?.message,
        );
        isLoading=true;
        getdata();
        isLoading=false;
        update();
        bool test4 = Get.isRegistered<ProfileController>();
        if(test4){
          Get.delete<SettingsController>();
          Get.delete<ProfileController>();

        }
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = "$e";
      String part = errorMessage.substring(0, errorMessage.length);
      // Show error message on the screen
      print(part);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: part,
      );
    }
  }
  @override
  void dispose() {
    usernameController.dispose();
    firtNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
    super.dispose();
  }
}