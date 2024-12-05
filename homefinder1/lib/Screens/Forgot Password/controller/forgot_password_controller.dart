// ignore_for_file: avoid_print, duplicate_ignore, use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/verifiction_code_forget_password/verification_code_forget_password.dart';
import '../../../models/forget_password_model.dart';
import '../../../services/auth_service.dart';

class ForgotPasswordController extends GetxController{


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
      // ignore: avoid_print
      print("valide");

    }
    else {
      print("not valid");
    }
  }
  Future<void> forgotPassword(BuildContext context) async {
    try {
      ForgetPaaswordModel? data = await AuthServices.forgetPassword(
          emailaddressController.text,
          context
      );
      if (data?.status == "success") {
        Get.to(()=>VerficationCodeForget(email: emailaddressController.text));
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


}
