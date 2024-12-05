import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/ChatingScreens/chatlist/chats_list_screen.dart';
import 'package:homefinder1/Screens/change_password/change_password_screen.dart';
import 'package:homefinder1/Screens/delete_account/delete_account_screen.dart';
import 'package:homefinder1/Screens/edit_profile/edit_profile.dart';
import 'package:homefinder1/Screens/profile/controller/profile_controller.dart';
import 'package:homefinder1/Screens/settings/controller/settings_controller4.dart';
import 'package:homefinder1/Widget/custom_bottom_navigation_bar_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../favorite/favorite_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (SettingsController controller) {
          return Scaffold(
            appBar: AppBar(

              leadingWidth: Get.width,
              toolbarHeight: Get.height*0.14,
              leading: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 59.5,
                        height: 58.88,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: NetworkImage(controller.data?.image?.url??"https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black-thumbnail.png"),
                              fit: BoxFit.fill,
                            )
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.data?.fullName??"",

                          style: TextStyle(
                              fontSize: 15,
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.w800,
                              fontFamily: kRegularFont),
                        ),

                        Text(controller.data?.email??"",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff535763),
                                fontWeight: FontWeight.w600,
                                fontFamily: kRegularFont))
                      ],
                    ),
                  )
                ],

              ),

            ),
            bottomNavigationBar: CustomBottomNavigationBarWidget(selectedOne:
            "lib/assets/images/homeIconButtonNavigationUnselected.png",selectedFifth: "lib/assets/images/SettingsIconButtomNavBar.png",),
            body:controller.isLoading
                ? Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFFe9d9e9),
                rightDotColor: const Color(0xFF8a81d2),
                size: 200,
              ),
            )
                :  Column(
              children: [
                Center(
                    child: Container(

                      height: Get.height*0.66,
                      width: Get.width*0.95,

                      child: ListView.separated(
                          padding: EdgeInsets.only(top: 10),
                          physics: NeverScrollableScrollPhysics()
                          ,itemBuilder: (context,index){return
                        InkWell(
                          onTap: (){
                            controller.selectedIndex=index;
                            if(controller.selectedIndex==4){
                              controller.signOut(context);
                            }else if(controller.selectedIndex==5){
                              Get.to(()=>DeleteAccountScreen());
                            }else if(controller.selectedIndex==1){
                              Get.to(()=>ChangePasswordScreen());
                            }else if(controller.selectedIndex==0){
                              bool test4 = Get.isRegistered<ProfileController>();
                              if(test4){
                                Get.delete<ProfileController>();
                              }
                              Get.to(()=>EditProfileScreen());
                            }else if(controller.selectedIndex==3){
                              Get.to(()=>FavoriteScreen());
                            }else if(controller.selectedIndex==2){
                              Get.to(()=>ChatsListScreen());
                            }
                            setState(() {

                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.selectedIndex==index?kPrimaryColor:Colors.transparent,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            width: Get.width*0.92,
                            height: Get.height*0.075,
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:  controller.selectedIndex==index?Colors.grey.shade300:Colors.transparent,
                                            offset: Offset(0, 0),
                                            blurRadius: 30)
                                      ]
                                  ),
                                  width: 28,
                                  height: 28,
                                  child: Image(image:
                                  AssetImage(controller.selectedIndex==index?controller.photosSelected[index]:controller.photosUnSelected[index]),
                                    fit: BoxFit.fill,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(controller.actions[index],style: TextStyle(
                                    color:  controller.selectedIndex==index?Colors.white:Color(0xff535763),fontFamily: kRegularFont,
                                    fontWeight: FontWeight.w800,fontSize: 17
                                ),),
                              )
                            ],),
                          ),
                        );}, separatorBuilder: (context,index){return
                        SizedBox(height: 15,);}, itemCount: 6),
                    )
                )
              ],
            ),
          );});
  }
}
