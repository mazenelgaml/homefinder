// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';
import '../../Widget/custom_text_field_widget.dart';
import 'controller/delete_account_controller.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DeleteAccountController(),
    builder: (DeleteAccountController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delete account ",
          style: TextStyle(
              color: kTitles,
              fontFamily: kRegularFont,
              fontSize: 25,
              fontWeight: FontWeight.w900),
        ),
        leading: const CustomArrowBack(),
        leadingWidth: 75,
      ),

      body: SingleChildScrollView(
        child: Container(
          height: Get.height*0.77,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 30,bottom: 25),
                      child: Container(
                          width: Get.width*0.6,
                          height: Get.height*0.1,
                          child: Text("Enter your password to delete the account",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: kRegularFont,
                            color: Colors.black
                          ),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0,top: 25),
                      child: Center(
                        child: Container(
                          width: Get.width*0.97,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius:20,
                                color: Colors.grey.withOpacity(0.15),
                                offset: const Offset(3,3),

                              )
                            ]
                          ),
                          child: CustomTextFieldWidget(
                            Controller: controller.passwordController,
                            validator: controller.passwordValidator,
                            keyboardType: TextInputType.visiblePassword,
                            textfieldHint: "Enter Your Password",
                            textfieldIcon: const Image(
                              image: AssetImage("lib/assets/images/LockIcon.png"),
                            ),
                            ispasswordField: true,
                            obscureText:  !controller.passwordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: kPrimaryColor,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  controller.passwordVisible = !controller.passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0,top: 25),
                child: Center(
                  child: CustomElevatedButtonWidget(text: "Delete",
                      onPressed: (){
                    if(controller.formkey.currentState!.validate()){
                     controller.deleteAccount(context);
                    }
                      }, textStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: kRegularFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w900
                      ), style: ElevatedButton.styleFrom(
                        fixedSize:const Size (172.21,57),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
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
