// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/SplashScreen/splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/get_user_model.dart';
import '../../../models/log_out_model.dart';
import '../../../services/auth_service.dart';
import '../../../utilities/memory.dart';

class SettingsController extends GetxController {
   User? data ;
   bool isLoading=true;

   @override
   void onInit() {
      super.onInit();
      selectedIndex=7;

      getdata();


   }
   @override
   void onReady() {
      super.onReady();
      getdata();

   }
   bool test4 = Get.isRegistered<SettingsController>();

   int selectedIndex = 7;
   List<String> photosUnSelected = [
      "lib/assets/images/EditProfileSelected.png",
      "lib/assets/images/lockSettings.png",
      "lib/assets/images/chatSettings.png",
      "lib/assets/images/favoriteSettings.png",
      "lib/assets/images/logOutSettings.png",
      "lib/assets/images/deleteAccountSettings.png"
   ];
   List<String> photosSelected = [
      "lib/assets/images/editProfile.png",
      "lib/assets/images/SettingsLockSelected.png",

      "lib/assets/images/SettingsChatSelected.png",
      "lib/assets/images/SettingsFavoriteSelected.png",
      "lib/assets/images/SettingsLogOutSelected.png",
      "lib/assets/images/SettingsDeleteAccountSelected.png"
   ];
   List<String> actions = [
      "Edit Profile",
      "Change Password",
      "Chats",
      "Favorites",
      "Log out",
      "Delete account"
   ];

   Future<void> signOut(BuildContext context) async {
      try {
         SharedPreferences prefs = await SharedPreferences.getInstance();
         LogOutModel? data = await AuthServices.signOut(context);
         if (data?.status == "success") {
            StorageService s = StorageService(prefs);
            s.loggingOut();
            Get.to(() => SplashScreen());
         }
      } catch (e) {
         // Handle bad request error
         String errorMessage = "$e";
         String part = errorMessage.substring(0, errorMessage.length);
         // Show error message on the screen
         print(part);
         CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Error",
            text: part,
         );
      }
   }
   getdata() async
   {
      isLoading=true;
      update();
      var response = await AuthServices.fetchUserData();

      if (response == null) {
         print("some error occured");
      } else {
         data= response.user;

      }

      isLoading = false;

      update();


   }

}
