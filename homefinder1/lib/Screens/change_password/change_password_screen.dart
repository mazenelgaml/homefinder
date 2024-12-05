// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../Widget/custom_text_field_widget.dart';
import 'controller/change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen ({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChangePasswordController(),
    builder: (ChangePasswordController controller) {
    return  Scaffold(
      appBar: AppBar(

        toolbarHeight: Get.height*0.11,
        leading: const CustomArrowBack(),
        leadingWidth: 75,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5,left: 20,top: 5),
                width: Get.width*0.5,
                height: Get.height*0.14,
                child: Center(
                  child: Text("Change your password here",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        fontFamily: kRegularFont,
                        color: kDarkBlueColor
                    ),),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: Get.width*0.59,
                height: Get.height*0.1,
                child: Text("Select which contact details should we use to Change your password",
                  style: TextStyle(
                      fontFamily: kRegularFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0,top: 15),
                child: Center(
                  child: Container(
                    width: Get.width*0.97,
                    height: Get.height*0.1,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius:18,
                            color: Colors.grey.withOpacity(0.15),
                            offset: const Offset(3,3),

                          )
                        ]
                    ),
                    child: CustomTextFieldWidget(
                      formColor: const Color(0xffF3F3F3),
                      Controller: controller.oldPasswordController,
                      validator: controller.passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      textfieldHint: "Old Password",
                      ispasswordField: true,
                      obscureText:  !controller.oldPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          controller.oldPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.oldPasswordVisible = !controller.oldPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 5.0,top: 15),
                child: Center(
                  child: Container(
                    width: Get.width*0.97,
                    height: Get.height*0.1,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius:18,
                            color: Colors.grey.withOpacity(0.15),
                            offset: const Offset(3,3),

                          )
                        ]
                    ),
                    child: CustomTextFieldWidget(
                      formColor: const Color(0xffF3F3F3),
                      Controller: controller.newPasswordController,
                      validator: controller.passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      textfieldHint: "New Password",
                      ispasswordField: true,
                      obscureText:  !controller.newPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          controller.newPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.newPasswordVisible = !controller.newPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0,top: 20),
                child: Center(
                  child: Container(
                    width: Get.width*0.97,
                    height: Get.height*0.1,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius:18,
                            color: Colors.grey.withOpacity(0.15),
                            offset: const Offset(3,3),

                          )
                        ]
                    ),
                    child: CustomTextFieldWidget(
                      formColor: const Color(0xffF3F3F3),
                      Controller: controller.confirmPasswordController,
                      validator: controller.confirmValidator,
                      keyboardType: TextInputType.visiblePassword,
                      textfieldHint: "Confirm Password",
                      ispasswordField: true,
                      obscureText:  !controller.confirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          controller.confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.confirmPasswordVisible = !controller.confirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height*0.25,
                child: Center(
                  child: CustomElevatedButtonWidget(
                      text: "Update",
                      onPressed: (){if(controller.formkey.currentState!.validate()){
                     controller.changeYourPassword(context);
                      }},
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
                        fontFamily: kRegularFont
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        fixedSize: const Size(180, 65)
                      )),
                ),
              )
            ],
          ),

        ),
      ),
    );});
  }
}