// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../models/auth_model.dart';
import '../../../../services/auth_service.dart';
import '../../../Upload Photo/upload_photo.dart';

class CompleteSignUpController extends GetxController{

  final  formkey =  GlobalKey<FormState>();

  final  fisrtnameController =  TextEditingController();
  final  lastnameController =  TextEditingController();
  final  genderController  = TextEditingController();
  final  phoneController = TextEditingController();


  String? fisrtnameValidator (username){
    if (RegExp(
        r"^[\p{L} ,.'-]*$",
        caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(username!)
    ) {

    } else {
      return "   Enter Correct First Name";

    }
    return null;
  }

  String? lastnameValidator (username){
    if (RegExp(
        r"^[\p{L} ,.'-]*$",
        caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(username!)
    ) {

    } else {
      return "   Enter Correct last Name";

    }
    return null;
  }


String? genderValidator (gender){
    if( RegExp(r'^Female|female|Male|male').hasMatch(gender!)){

    } else {
      return "   Enter Correct Gender" ; }
    return null;
  }

  String? phoneValidator (phone){
    if( RegExp(r'^(?:[+0]9)?[0-9]{11}$').hasMatch(phone!)){

    } else {
      return "   Enter Correct Phone No." ; }
    return null;
  }




Future<void> CompleteSignUp(BuildContext context) async {
  try {
    AuthModel? data = await AuthServices.completeSigningUp(
        fisrtnameController.text,
        lastnameController .text,
        genderController.text,
        phoneController.text,
        context
    );
    if (data?.status == "success") {

      Get.to(() =>const UploadPhoto());
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


  saveAndValidate() {
    final  formkey =  GlobalKey<FormState>();
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("valide");
    }
    else {
      print("not valide");
    }
  }}

  @override
  Widget build(BuildContext context) {
    return Container();

  }
