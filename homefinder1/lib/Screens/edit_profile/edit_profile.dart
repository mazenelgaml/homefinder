
// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../settings/controller/settings_controller4.dart';
import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: EditProfileController(),
        builder: (EditProfileController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height*0.088,
              title: Text(
                "Edit Profile",
                style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: kRegularFont),
              ),
              leading:Row(
                children: [
                  const SizedBox(width: 25,),
                  Container(
                    width: 50,
                    height: 55,
                    decoration: BoxDecoration(color: const Color(0xff9292FD).withOpacity(0.2),
                        border: Border.all(color: const Color(0xff9292FD).withOpacity(0.2)),borderRadius: BorderRadius.circular(15)),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: IconButton(onPressed: (){
                        bool test5 = Get.isRegistered<SettingsController
                        >();
                        if(test5){
                          Get.delete<SettingsController>();
                        }
                        SettingsController ss=SettingsController();
                        ss.getdata();

                        Get.back();
                      }, icon: const Icon(Icons.arrow_back_ios ,size: 20,color: Color(0xff6C63FF),) ,),
                    ),

                  ),
                ],
              ),
              leadingWidth: 80,
            ),
            body: Container(
              height: Get.height,
              child: controller.isLoading
                  ? Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFFe9d9e9),
                  rightDotColor: const Color(0xFF8a81d2),
                  size: 200,
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: NetworkImage(controller.data?.image?.url??"https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black-thumbnail.png"),
                                fit: BoxFit.fill)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if(controller.data?.image?.url!=null) {
                                  controller.deleteUsrPhoto(context);
                                }else{
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    title: "Sorry",
                                    text: "threre is no profile image for you to delete",
                                  );
                                }
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: Colors.transparent),
                                    color: kPrimaryColor),
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if(controller.data?.image?.url!=null) {
                            controller.pickImage(context);
                          }else{    CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            title: "Sorry",
                            text: "threre is no profile image for you to edit it",
                          );

                          }},
                        child: Text(
                          "Change Profile Picture",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kRegularFont,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        "Profile Info",
                        style: TextStyle(
                            color: kVeryDarkBlueColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                            fontFamily: kRegularFont),
                      ),
                    ),
                    Form(
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.14,
                            width: Get.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0, top: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8, left: 14),
                                        child: Text(
                                          "First Name",
                                          style: TextStyle(
                                              color: const Color(0xff888888),
                                              fontFamily: kRegularFont,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                        height: 65,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.withOpacity(0.2)),
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                spreadRadius: -20,
                                                blurRadius: 20)
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: controller.firtNameController,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              filled: true,
                                              fillColor: const Color(0xffF2F7FF)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8, right: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8, left: 14),
                                        child: Text(
                                          "Last Name",
                                          style: TextStyle(
                                              color: const Color(0xff888888),
                                              fontFamily: kRegularFont,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                        height: 65,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.withOpacity(0.2)),
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                spreadRadius: -20,
                                                blurRadius: 20)
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: controller.lastNameController,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              filled: true,
                                              fillColor: const Color(0xffF2F7FF)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: Get.width,
                            height: Get.height * 0.13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 3),
                                  child: Text(
                                    "User Name*",
                                    style: TextStyle(
                                        color: const Color(0xff888888),
                                        fontFamily: kRegularFont,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  height: 65,
                                  width: Get.width * 0.9,
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          spreadRadius: -20,
                                          blurRadius: 20)
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: controller.usernameController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        filled: true,
                                        fillColor: const Color(0xffF2F7FF)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: Get.width,
                            height: Get.height * 0.13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text(
                                    "Phone Number*",
                                    style: TextStyle(
                                        color: const Color(0xff888888),
                                        fontFamily: kRegularFont,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  height: 65,
                                  width: Get.width * 0.9,
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          spreadRadius: -20,
                                          blurRadius: 20)
                                    ],
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: controller.phoneNumberController,
                                    decoration: InputDecoration(

                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        filled: true,
                                        fillColor: const Color(0xffF2F7FF)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: Get.width,
                            height: Get.height * 0.13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text(
                                    "Gender*",
                                    style: TextStyle(
                                        color: const Color(0xff888888),
                                        fontFamily: kRegularFont,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  height: 65,
                                  width: Get.width * 0.9,
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          spreadRadius: -20,
                                          blurRadius: 20)
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: controller.genderController,

                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            const BorderSide(color: Colors.transparent)),
                                        filled: true,
                                        fillColor: const Color(0xffF2F7FF)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Container(
                                  width: Get.width*0.6,
                                  height: Get.height*0.065,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: CustomElevatedButtonWidget(
                                    text: 'Update',
                                    onPressed: () {

                                        print(controller.firtNameController.text
                                        );
                                        print(controller.lastNameController.text
                                        );
                                        controller.editProfile(context);

                                    },
                                    textStyle: TextStyle(

                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        fontFamily: kRegularFont),
                                    style:
                                    ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );});
  }
}