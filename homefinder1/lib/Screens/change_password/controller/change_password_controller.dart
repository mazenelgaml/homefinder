// ignore_for_file: curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/settings/settings_screen.dart';
import 'package:homefinder1/services/auth_service.dart';

import '../../../models/delete_account_model.dart';


class ChangePasswordController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    oldPasswordVisible = false;
    newPasswordVisible = false;
    confirmPasswordVisible = false;
  }
  bool oldPasswordVisible = false;
  bool newPasswordVisible = false;
  bool confirmPasswordVisible = false;


  final  formkey =  GlobalKey<FormState>();
  final oldPasswordController =  TextEditingController();
  final newPasswordController =  TextEditingController();
  final confirmPasswordController =  TextEditingController();
  String? passwordValidator(password) {
    if (RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password!)) {

    } else {
      return "   Enter Correct password";
    }
    return null;
  }
  String? confirmValidator (String? val){
    if(val!.isEmpty)
      return 'Empty';
    else if(val != newPasswordController.text)
      return 'Not Match';
    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(val))
    {
      return "Please Enter a Valid password";
    }else return null;
  }
  Future<void> changeYourPassword(BuildContext context) async {
    try {
      DeleteAccountModel? data = await AuthServices.changePassword(
          oldPasswordController.text,
          newPasswordController.text,
          confirmPasswordController.text,
          context
      );
      if (data?.status == "success") {
        Get.to(() => const SettingsScreen());
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