import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/edit_listing/widget/photos.dart';
import 'package:homefinder1/models/update_residence_model.dart';
import 'package:homefinder1/services/residences_services.dart';

import '../../../models/get_one_residence_model.dart'as o;
import '../../../utilities/colors.dart';

class EditListingController extends GetxController{
  getDataOfOneResidences(String resId, BuildContext context) async {
    try {
      o.GetOneResidencesModel? response =
      await ResidenceServices.fetchOneResidences(resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        residence = response.residence;

        // Print or access other properties as needed
        print("Number of residences: ${residence}");



      }


      update();
    } catch (e) {
      print("Exception occurred: $e");

    }
  }

  String resId;
  final List gridview = [
    {
      "image" : "lib/assets/images/Shape1.png",
    },
    {
      "image" : "lib/assets/images/Shape2.png",
    },
    {
      "image" : "lib/assets/images/Shape3.png",
    }
  ];

  final List gridview1 = [
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "2",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "3",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "4",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "5",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "6",
    },
  ];

  EditListingController(this.resId);

  o.Residence? residence;
  static String? houseId;
  int selectedIndex1=0;
  TextEditingController propertyTitle=TextEditingController();
  ScrollController scroll=ScrollController();
  List<String> rOrS=["Rent","Sell"];
  int selectedIndex2=0;
  String propertyType="rent";
  String propertyCategory="house";
  List<String> hOrAOrHOrVOrC=["House","Apartment","Hotel","Villa","Cottage"];
  Future<void> updateResidance(String title,String type,String category,BuildContext context) async {
    try {
      UpdateResidence? data = await ResidenceServices.updateResidence(
          propertyTitle.text,
          propertyType,
          propertyCategory,
          context,
        resId
      );
      if (data?.status == "success") {
        EditListingController.houseId=data?.residence?.id;
        print(houseId);
        Get.to(() =>ImagePickerExample1(data?.residence?.id??"",));
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