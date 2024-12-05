

import 'dart:ui';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:homefinder1/models/fourth_edit_model.dart';

import '../../../Widget/custom_elevated_button_widget.dart';
import '../../../models/fourth_complete_model.dart';
import '../../../services/residences_services.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';
import '../../home/home_screen.dart';

class EditListingFourthDetailsController extends GetxController{

  ScrollController scroll= ScrollController();
  final  formkey =  GlobalKey<FormState>();
  final String residanceId;
  EditListingFourthDetailsController(this.residanceId);

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
  Future<void> fourthEdit(
      BuildContext context,
      ) async {
    try {
      FourthEditModel? data = await ResidenceServices.fourthEdit(
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