// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing/add_listing_screen.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import 'package:homefinder1/Screens/profile/profile_screen.dart';
import 'package:homefinder1/Screens/settings/settings_screen.dart';

import '../Screens/home/controller/home_controller.dart';
import '../Screens/profile/controller/profile_controller.dart';
import '../Screens/settings/controller/settings_controller4.dart';
class CustomBottomNavigationBarWidget extends StatelessWidget{
  const CustomBottomNavigationBarWidget({super.key, this.selectedOne, this.selectedFourth, this.selectedFifth});
   final String? selectedOne;
   final String? selectedFourth;
  final String? selectedFifth;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
          ,boxShadow: const [BoxShadow(color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 5)]),
      child: BottomNavigationBar(
        onTap: (index){
          if(index==0){
            bool test4 = Get.isRegistered<HomeController>();
            if(test4){
              Get.delete<HomeController>();
            }
            Get.to(()=>const HomeScreen());
          }else if(index==1){
            Get.to(()=>const AddListing());
          }else if(index==2){
            bool test4 = Get.isRegistered<SettingsController>();
            if(test4){
              Get.delete<SettingsController>();
            }
            Get.to(()=>const SettingsScreen());
          }else{
            bool test4 = Get.isRegistered<ProfileController>();
            if(test4){
              Get.delete<ProfileController>();
            }
            Get.to(()=>const ProfileScreen());

          }
        },
        backgroundColor: Colors.white10,
        elevation: 0,

        iconSize:40,
        unselectedItemColor: const Color(0xff8694A6),
        selectedItemColor: const Color(0xff6C63FF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Container(width: Get.width*0.07,height:Get.height*0.03,child: Image(image: AssetImage(selectedOne??'lib/assets/images/bottomHomeIcon.png'),fit: BoxFit.fill,)),
            backgroundColor: const Color(0x000000ff),
            label: "Home",

          ),
          BottomNavigationBarItem(
              icon: Container(width: Get.width*0.08,height:Get.height*0.035,child: const Image(image: AssetImage('lib/assets/images/Home Add.png'),fit: BoxFit.fill,)),
              backgroundColor: const Color(0x000000ff),
              label: "Add listing"
          ),
          BottomNavigationBarItem(
              icon: Container(width: Get.width*0.07,height:Get.height*0.03,child: Image(image: AssetImage(selectedFifth??'lib/assets/images/SettingsIcon.png'),width: 25,height: 25,fit: BoxFit.fill,)),
              backgroundColor: const Color(0x000000ff),
              label: "Settings"
          ),
          BottomNavigationBarItem(
              icon: Container(width: Get.width*0.07,height:Get.height*0.03,child: Image(image: AssetImage(selectedFourth??'lib/assets/images/PersonIcon.png'),width: 25,height: 25,fit: BoxFit.fill,)),
              backgroundColor: const Color(0x000000ff),
              label: "Profile"
          ),
        ],),
    );

  }

}