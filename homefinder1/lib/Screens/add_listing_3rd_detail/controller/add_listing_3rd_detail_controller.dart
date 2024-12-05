

// ignore_for_file: use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing_fourth_details/add_listing_fourth_details_screen.dart';
import 'package:homefinder1/models/third_complete_model.dart';
import 'package:homefinder1/services/residences_services.dart';


class AddListingThirdDetailsController extends GetxController {
  
  
  ScrollController scroll = ScrollController();
   String residanceId;
  AddListingThirdDetailsController(this.residanceId);
  int counter1 = 1;
  int counter2 = 1;
  int counterBedroom = 1;
  int counterBathroom = 1;
  int counterKitchen = 1;
  int counterRoomWithoutBathroom = 1;

  void incrementCounter1() {

      counter1++;
      update();

  }

  void decrementCounter1() {

      counter1--;
      update();
  }

  void incrementCounter2() {

      counter2++;
      update();
  }

  void decrementCounter2() {

      counter2--;
      update();
  }

  void incrementCounterBedroom() {

      counterBedroom++;
      update();
  }

  void decrementCounterBedroom() {

      counterBedroom--;
       update();
  }

  void incrementCounterBathr0om() {

      counterBathroom++;
      update();

  }

  void decrementCounterBathroom() {

      counterBathroom--;
      update();

  }

  void incrementCounterKitchen() {

      counterKitchen++;
      update();

  }

  void decrementCounterKitchen() {

      counterKitchen--;
      update();



  }

  void incrementCounterRoomsWithoutBathroom() {

      counterRoomWithoutBathroom++;
      update();

  }

  void decrementCounterRoomsWithoutBathroom() {

      counterRoomWithoutBathroom--;
      update();

  }


  final formkey = GlobalKey<FormState>();
  final TextEditingController basementAreaController = TextEditingController();
  final List<bool> hasGarage = [true , false];
  bool hasGarageSelected = true ;
  final List<String> garageType = [
    "more than one",
    "attached",
    "basement",
    "built in",
    "car port",
    "detached",
    "not available"
  ];
  String garageTypeSelected = "attached";
  int selectedGarageTypeIndex = 0;

  final List<String> garageQuality = [
    "good",
    "fair",
    "poor",
    "average",
    "excellent",
    "not available"
  ];
  String garageQualitySelected = "excellent";
  int selectedGarageQualityIndex = 0;

  final List<String> garageFinish = [
    "finished",
    "rough finished",
    "unfinished",
    "not available"
  ];
  String garageFinishSelected = "finished";
  int selectedGarageFinishIndex = 0;

  final List<bool> hasBasment = [true , false];
  bool hasBasmentSelected = false;

  final List<bool> hasFirePlace = [true , false];
  bool hasFirePlaceSelected = true;


  final String basementArea = '';

  final List<String> basementExposure = [
    "good",
    "average",
    "minimum",
    "exposure"
  ];
  String basementExposureSelected = "minimum";
  int selectedBasementExposureIndex = 0;

  //basmetfintype1
  final List<String> ratingOfBasement = [
    "good",
    "average",
    "below average",
    "average rec room",
    "low",
    "unfinished"
  ];
  String ratingBasementSelected = "low";
  int selectedRatingOfBasement = 0;

  final List<String> heightOfBasement = [
    "excellent",
    "good",
    "average",
    "fair",
    "poor"
  ];
  //basmentquality
  String heightOfBasementSelected = "fair";
  int selectedHeightOfBasementIndex = 0;

  final List<String> conditionOfBasement = [
    "excellent",
    "good",
    "average",
    "fair",
    "poor",
    "not available"
  ];
  String conditionOfBasmentSelected = "average";
  int selectedConditionOfBasement = 0;

  final List<String> firePlaceQuality = [
    "excellent",
    "good",
    "average",
    "fair"
  ];
  String firePlaceQualitySelected = "good";
  int selectedFirePlaceQualityIndex = 0;

  final List<String> kitchenQuality = ["excellent", "good", "average", "fair"];
  String kitchenQualitySelected = "good";
  int selectedKitchenQualityIndex = 0;

  Future <void> thirdComplete(
      BuildContext context,
      )async{
     try{
      ThirdCompleteModel? data = await ResidenceServices.thirdComplete(
          hasGarageSelected,
          garageTypeSelected,
          garageQualitySelected,
          counter1,// counter for garage cars
          garageFinishSelected,
          hasBasmentSelected,
          hasFirePlaceSelected,
          counter2,// counter for fire places
          firePlaceQualitySelected,
          counterBedroom, // counter for bedroom
          counterBathroom, //counter for bathroom
          counterKitchen, //counter for kitchen
          kitchenQualitySelected,
          counterRoomWithoutBathroom,
          int.parse(basementAreaController.text),
          basementExposureSelected,
          ratingBasementSelected,
          heightOfBasementSelected,
          conditionOfBasmentSelected,
          context,
          residanceId
      );
      if (data?.status == "success") {
        Get.to(() =>AddListingFourthDetailsScreen(residanceId: residanceId,));
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



