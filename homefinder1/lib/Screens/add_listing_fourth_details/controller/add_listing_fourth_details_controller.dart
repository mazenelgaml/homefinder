

// ignore_for_file: use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/pridected_price/pridected_price_screen.dart';

import '../../../models/fourth_complete_model.dart';
import '../../../services/residences_services.dart';


class AddListingFourthDetailsController extends GetxController{

  ScrollController scroll= ScrollController();
  final  formkey =  GlobalKey<FormState>();
  final String residanceId;
  AddListingFourthDetailsController(this.residanceId);

  final List<String>lotConfig=[
    "inside",
    "corner",
    "cul de sac",
    "frontage on 2",
    "frontage on 3"
  ];
  int selectedLotConfigIndex=0;
  String lotConfigSelected="inside";
  final List<String>landContour=[
    "level",
    "banked",
    "hillside",
    "depression"
  ];
  int selectedLandContourIndex=0;
  String landContourSelected="level";
  final List<String>landSlope=[
    "gentle",
    "moderate",
    "severe"
  ];
  int selectedLandSlopeIndex=0;
  String landSlopeSelected="gentle";
  final List<String>pavedDrive=[
    "paved",
    "gravel",
    "partial"
  ];
  int selectedPavedDriveIndex=0;
  String pavedDriveSelected="paved";
  TextEditingController poolAreaController= TextEditingController();
  TextEditingController overallQualityontroller= TextEditingController();
  TextEditingController overallConditionController= TextEditingController();
  TextEditingController totalAreaController= TextEditingController();
  TextEditingController totalPropertyAreaController=TextEditingController();
  TextEditingController lotAreaController=TextEditingController();
  TextEditingController  lotFrontageController= TextEditingController();
  TextEditingController totalSquareFeetController= TextEditingController();
  TextEditingController lowQualitySquareFeetController= TextEditingController();
  TextEditingController valueOfMiscellaneousFeatureController= TextEditingController();
  TextEditingController  houseAgeController= TextEditingController();
  TextEditingController houseRemodelageController= TextEditingController();
  Future<void> fourthComplete(
      BuildContext context,
      ) async {
    try {
      FourthCompleteModel? data = await ResidenceServices.fourthComplete(
          lotConfigSelected,
          landContourSelected,
          landSlopeSelected,
          pavedDriveSelected,
          int.parse(poolAreaController.text),
          int.parse(overallQualityontroller.text),
          int.parse(overallConditionController.text),
          int.parse(totalAreaController.text),
          int.parse(totalPropertyAreaController.text),
          int.parse(lotAreaController.text),
          int.parse(lotFrontageController.text),
          int.parse(totalSquareFeetController.text),
          int.parse(lowQualitySquareFeetController.text),
          int.parse(valueOfMiscellaneousFeatureController.text),
          int.parse(houseAgeController.text),
          int.parse(houseRemodelageController.text),
          context,
          residanceId

      );
      if (data?.status == "success") {
        print(residanceId);
        Get.to(()=>PredictPriceScreen(resId: residanceId,));
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