// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures, avoid_print


import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/verification_code/verfication_code_screen.dart';
import 'package:homefinder1/models/auth_model.dart';
import 'package:homefinder1/services/auth_service.dart';
import 'package:homefinder1/utilities/memory.dart';
import 'package:image_picker/image_picker.dart';


class SignUpController extends GetxController {

  final formkey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  final usernameController = TextEditingController();
  final emailaddressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    passwordVisible = false;
    passwordVisible1 = false;
  }
  XFile? image;

  Future<void> getImageFromUserThroughCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    update();
  }

  //get image from user through gallery
  Future<void> getImageFromUserThroughGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  choosePhotoSource(context) async {
    // showModalBottomSheet<void>(
    //     backgroundColor: Colors.transparent,
    //     context: context, builder: (BuildContext context) {
    //   return ChooseCameraSource(openCamera: () {
    //     getImageFromUserThroughCamera();
    //   }, openGallery: () {
    //     getImageFromUserThroughGallery();
    //   },);
    // });
  }
  bool passwordVisible = false;
  bool passwordVisible1 = false;

  String? usernameValidator(username) {
    if (RegExp(r"^[^a-zA-Z0-9]{6,}$"
        ,
        caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(username!)) {
    } else {
      return "   Enter Correct User Name";
    }
    return null;
  }

  String? emailValidator(email) {
    if (RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email!)) {
    } else {
      return "   Enter Correct Email";
    }
    return null;
  }

  String? passwordValidator(password) {
    if (RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password!)) {
    } else {
      return "   Enter Correct password";
    }
    return null;
  }

  saveAndValidate() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("valide");
    } else {
      print("not valide");
    }
  }

  String? confirmValidator(String? val) {
    if (val!.isEmpty)
      return 'Empty';
    else if (val != passwordController.text)
      return 'Not Match';
    else if (!RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(val)) {
      return "Please Enter a Valid password";
    } else
      return null;
  }

  Future<void> registerWithEmail(BuildContext context) async {
    try {
      AuthModel? data = await AuthServices.signingUp(
        usernameController.text,
        emailaddressController.text,
        passwordController.text,
        confirmPasswordController.text,
        context
      );
      if (data?.status == "success") {

        await Get.find<StorageService>().saveAccountId(data?.userId ?? "");
        await Get.find<StorageService>().saveAccountToken(data?.token ?? "");
        Get.to(() => const VerficationCode());

      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35); // Extracts "world"



      // Show error message on the screen
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
    emailaddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}