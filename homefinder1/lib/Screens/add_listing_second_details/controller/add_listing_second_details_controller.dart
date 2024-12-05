// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing_3rd_detail/add_listing_3rd_detail_screen.dart';
import 'package:homefinder1/models/second_complete_model.dart';
import '../../../services/residences_services.dart';

class AddListingSecondDetailController extends GetxController{
   String residanceId;
  AddListingSecondDetailController(this.residanceId);
  ScrollController scroll= ScrollController();
  final List <String> roofStyle=[
    "Flat",
    "Gable",
    "Gambrel",
    "Hip",
    "Shed"
  ];
  int selectedRoofStyleIndex=0;
  String roofStyleSelected="Flat";
  final List <String> roofMaterial=[
    "clay or tile",
    "standard shingle",
    "membran",
    "roll",
    "gravel & tar",
    "wood shakes"

  ];
  int selectedRoofMaterialIndex=0;
  String roofMaterialSelected="clay or tile";
  final TextEditingController masonryVeneerAreaController=TextEditingController();
  final  formkey =  GlobalKey<FormState>();
  final List<String> houseStyle=[
    "1Story",
    "1.5Fin",
    "1.5Unf",
    "2Story",
    "2.5Fin",
    "SLvl"
  ];
  int selectedHouseStyleIndex=0;
  String houseStyleSelected="1Story";
  final List<String> typeOfResidence=[
    "2 family conversion",
    "multilevel and split",
    "duplex",
    "split foyer",
    "multi-level",
    "1 story unfinished attic",
    "2story and older",
    "2story and newer"
        "1story and older",
    "1story and newer"
  ];
  String? selectedValue;
  String typeOfResidenceSelected="2 family conversion";
  final List<String> centralAir=[
    "yes",
    "no",
  ];
  int selectedCentralAirIndex=0;
  String centralAirSelected="yes";
  final List<String> street=[
    "paved",
    "gravel",
  ];
  int selectedStreetIndex=0;
  String streetSelected="paved";
  final List<String> alley=[
    "Paved",
    "Gravel",
    "no alley accesss",
  ];
  int selectedAlleyIndex=0;
  String alleySelected="Paved";
  final List<String> exteriorCoveringOnHouse1=[
    "asbestos shingles",
    "asphalt shingles",
    "brick face",
    "brick common",
    "cement board",
    "hardboard",
    "hardboard siding",
    "metal siding",
    "plywood",
    "precast concrete",
    "stucco",
    "vinyl siding",
    "wood siding",
    "wood shingles",
    "cinder block",
    "stone",
    "imitation stucco",
    "Other"
  ];
  String? selectedValue1;
  String exteriorCoveringOnHouse1Selected="asbestos shingles";
  final List<String> exteriorCoveringOnHouse2=[
    "asbestos shingles",
    "asphalt shingles",
    "brick face",
    "brick common",
    "cement board",
    "hardboard",
    "hardboard siding",
    "metal siding",
    "plywood",
    "precast concrete",
    "stucco",
    "vinyl siding",
    "wood siding",
    "wood shingles",
    "cinder block",
    "stone",
    "imitation stucco",
    "Other"
  ];
  String? selectedValue2;
  String exteriorCoveringOnHouse2Selected="asbestos shingles";
  final List<String> heating=[
    "floor",
    "gas",
    "gas water",
    "gravity",
    "other water",
    "Wall"
  ];
  int selectedHeatingIndex=0;
  String heatingSelected="floor";
  final List<String> heatingQuality=[
    "excellent",
    "good",
    "average",
    "fair",

  ];
  int selectedHeatingQualityIndex=0;
  String heatingQualitySelected="excellent";
  final List<String> masonryVeneerType=[
    "brick face",
    "brick common",
    "cinder block",
    "Stone",
    "None",

  ];
  int selectedMasonryVeneerTypeIndex=0;
  String masonryVeneerTypeSelected="brick face";

  final List<String> exteriorCondition=[
    "excellent",
    "good",
    "average",
    "fair",
  ];
  int selectedExteriorConditionIndex=0;
  String exteriorConditionSelected="excellent";
  final List<String> exteriorQuality=[
    "excellent",
    "good",
    "average",
    "fair",
    "poor"
  ];
  int selectedExteriorQualityIndex=0;
  String exteriorQualitySelected="excellent";

  final List<String> condition1=[
    "normal",
    "adjacent to feeder street",
    "adjacent to arterial street",
    "adjacent to east west railroad",
    "adjacent to north south",
    "within 200 of east west",
    "within 200 of north South",
    "adjacent to positive off site feature",
    "near positive off-site feature",

  ];
  String? selectedValue3;
  String condition1Selected="normal";
  final List<String> condition2=[
    "normal",
    "adjacent to feeder street",
    "adjacent to arterial street",
    "adjacent to east west railroad",
    "adjacent to north south",
    "within 200 of east west",
    "within 200 of north South",
    "adjacent to positive off site feature",
    "near positive off-site feature",

  ];
  String? selectedValue4;
  String condition2Selected="normal";

  Future<void> secondComplete(
      BuildContext context
      ) async {
    try {
  SecondCompleteModel? data = await ResidenceServices.secondComplete(
   roofStyleSelected,
    roofMaterialSelected,
    houseStyleSelected,
    typeOfResidenceSelected,
    centralAirSelected,
    streetSelected,
    alleySelected,
    heatingSelected,
    heatingQualitySelected,
    masonryVeneerTypeSelected,
      int.parse(masonryVeneerAreaController.text),
    exteriorCoveringOnHouse1Selected,
    exteriorCoveringOnHouse2Selected,
    exteriorConditionSelected,
    exteriorQualitySelected,
    condition1Selected,
    condition2Selected,
    context,
      residanceId



      );
      if (data?.status == "success") {
        Get.to(() =>AddListingThirdDetailsScreen(residanceId: residanceId,));
        print(data);
      }
    } catch (e) {
      String errorMessage = " $e";
      String part = errorMessage.substring(0, errorMessage.length);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: part,
      );
    }

  }

}