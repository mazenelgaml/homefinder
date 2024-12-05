// ignore_for_file: avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import '../../../../models/auth_model.dart';
import '../../../../services/auth_service.dart';
import '../../../../utilities/memory.dart';

class SignInController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    passwordVisible = false;
  }
  bool passwordVisible = false;


final  formkey =  GlobalKey<FormState>();

final emailaddressController =  TextEditingController();
final passwordController =  TextEditingController();


String? emailValidator (email) {
  if (RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email!)) {

  }
  else {
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
  }
  else {
    print("not valide");
  }
}
  Future<void> SignInWithEmail(BuildContext context) async {
    try {
      AuthModel? data = await AuthServices.signingIn(
          emailaddressController.text,
          passwordController.text,
          context
      );
      if (data?.status == "success") {
        await Get.find<StorageService>().saveAccountId(data?.userId ?? "");
        await Get.find<StorageService>().saveAccountToken(data?.token ?? "");
        Get.to(() => const HomeScreen());
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
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
    emailaddressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}
