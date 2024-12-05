// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/services/residences_services.dart';

import '../../../models/create_residence_first.dart';
import '../../add listing - photos/widget/photos.dart';

class AddListingController extends GetxController{
   static String? houseId;
   int selectedIndex1=0;
   TextEditingController propertyTitle=TextEditingController();
   ScrollController scroll=ScrollController();
   List<String> rOrS=["Rent","Sell"];
   int selectedIndex2=0;
   String propertyType="rent";
   String propertyCategory="house";
   List<String> hOrAOrHOrVOrC=["House","Apartment","Hotel","Villa","Cottage"];
   Future<void> createResidance(String title,String type,String category,BuildContext context) async {
      try {
         CreateResidence? data = await ResidenceServices.createResidence(
             propertyTitle.text,
             propertyType,
             propertyCategory,
             context
         );
         if (data?.status == "success") {
            AddListingController.houseId=data?.residence?.id;
            print(houseId);
            Get.to(() =>ImagePickerExample1( residenceId: data?.residence?.id??"",));
         }
      } catch (e) {
         String errorMessage = " $e";
         String part = errorMessage.substring(26, 35);
         CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Error",
            text: part,
         );
      }

   }
}