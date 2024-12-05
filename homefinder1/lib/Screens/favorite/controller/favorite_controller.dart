// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/controller/feature_estates_controller.dart';
import 'package:homefinder1/Screens/popular_nearest_you/controller/popular_nearest_you_controller.dart';

import '../../../models/get_one_residence_model.dart';
import '../../../models/get_user_favorite_model.dart';
import '../../../models/respose_model.dart';
import '../../../services/residences_services.dart';
import '../../home/controller/home_controller.dart';

class FavoriteController extends GetxController{

  BuildContext? context;
  FavoriteController(this.context);
  ScrollController scroll=  ScrollController();
  List<String> types=["All","House","Villa","appartment",];
  int selectedIndex=0;
  void favCategory(int index){
    selectedIndex=index;
    update();
  }
  List<Wishlist>?favs;
  int? favsCount;
  bool isLoading=true;
  @override
  void onInit()async{
    super.onInit();
    await getDataOfFavResidences(context!);
  }
  Residence?residence;
  getDataOfFavResidences(BuildContext context) async {
    isLoading=true;
      try {
        GetUserFavoriteModel? response = await ResidenceServices.fetchfavResidences( context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          favs = response.wishlist ?? [];
          favsCount = response.count ?? 0;

          // Print or access other properties as needed
          print("Number of residences: ${favs?.length}");
        }

        isLoading = false;
        update();
      } catch (e) {
        print("Exception occurred: $e");
        isLoading = false;
      }

  }
  Future<void> removeAllFav(BuildContext context) async {
    try {
      ResponseModel? data = await ResidenceServices.deleteAllFavorite(
                    context
      );
      if (data?.status == "success") {
           getDataOfFavResidences(context);
        print(data?.message);
        update();
        bool test4 = Get.isRegistered<HomeController>();
        if(test4){
          Get.delete<HomeController>();
          Get.delete<FeatureEstatesController>();
          Get.delete<PopularNearestYouController>();}
      }



    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }

  }
  getDataOfOneResidences(String resId, BuildContext context) async {
    try {
      GetOneResidencesModel? response =
      await ResidenceServices.fetchOneResidences(resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        residence = response.residence;

        // Print or access other properties as needed
        print("Number of residences: ${residence}");
;


      }


      update();
    } catch (e) {
      print("Exception occurred: $e");

    }
  }
}