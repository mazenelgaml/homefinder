// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/complete_sign_up.dart';
import 'package:homefinder1/Screens/reset_password/reset_password_screen.dart';
import 'package:homefinder1/models/serification_model.dart';

import '../../../services/auth_service.dart';

class VerficationCodeForgetController extends GetxController {
  String email;
  VerficationCodeForgetController(this.email);
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



  Future<void> sendVerificationCode(BuildContext context,int code) async {
    try {
      VerificationModel? data = await AuthServices.SendingVerificationCodeForget(
          context,
          verificationCodeController.text,
        email
      );

      if (data?.status == "success") {

        Get.to(() =>ResetPasswordScreen(email: email,));
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
  Future<void> resendVerificationCode(BuildContext context,String email) async {
    try {
      VerificationModel? data = await AuthServices.reSendingVerificationCodeForget(
          context,

          email
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
