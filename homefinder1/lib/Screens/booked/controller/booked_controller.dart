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

class bookedController extends GetxController{

  BuildContext? context;
  bookedController(this.context);
  ScrollController scroll=  ScrollController();
  List<String> types=["All","House","Villa","appartment",];
  int selectedIndex=0;
  void favCategory(int index){
    selectedIndex=index;
    update();
  }

  int? favsCount;
  bool isLoading=true;
  @override
  void onInit()async{
    super.onInit();
     await getDataOfOneResidences("6676c135c7dc590ddae55891", context!);
  }
  Residence?favs;


  getDataOfOneResidences(String resId, BuildContext context) async {
    try {
   GetOneResidencesModel? response =
      await ResidenceServices.fetchOneResidences(resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        favs = response.residence;

        // Print or access other properties as needed
        print("Number of residences: ${favs}");



      }



    } catch (e) {
      print("Exception occurred: $e");

    }
    isLoading=false;
    update();
  }

}