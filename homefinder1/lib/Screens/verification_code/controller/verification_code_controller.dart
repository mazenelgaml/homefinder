// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/complete_sign_up.dart';
import 'package:homefinder1/models/serification_model.dart';
import 'package:http/http.dart' as http;

import '../../../services/auth_service.dart';

class VerficationCodeController extends GetxController {
 final String userId;
    VerficationCodeController(this.userId);
  final  formkey =  GlobalKey<FormState>();
  final TextEditingController verificationCodeController = TextEditingController();
  late Timer _timer;
  int remainingTimeInSeconds = 60; // 90 minutes in seconds

  String formatTime(Duration duration) {
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Duration calculateRemainingTime() {
    return Duration(seconds: remainingTimeInSeconds);
  }
  void resendCode() {

      remainingTimeInSeconds = 60;
      startTimer();
      update();

  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTimeInSeconds <= 0) {
        _timer.cancel();
      } else {
        remainingTimeInSeconds--;
      }
      update(); // Update UI with new remaining time
    });
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel(); // Cancel timer when controller is closed to prevent memory leaks
  }

  Future<String?> fetchVerificationCode() async {
    final url = Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/auth/verification/65ef8459c2bd7a5646b05034');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['verificationCode'];
      }
    } catch (e) {
      print('Error fetching verification code: $e');
      return null;
    }
    return null;
  }



  Future<void> sendVerificationCode(BuildContext context,int code,) async {
    try {
      VerificationModel? data = await AuthServices.SendingVerificationCode(
          context,
          verificationCodeController.text,


      );

      if (data?.status == "success") {

        Get.to(() => const CompleteSignUp());
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
 Future<void> resendVerificationCode(BuildContext context) async {
   try {
     VerificationModel? data = await AuthServices.reSendingVerificationCode(
         context,
     );

     if (data?.status == "success") {

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
