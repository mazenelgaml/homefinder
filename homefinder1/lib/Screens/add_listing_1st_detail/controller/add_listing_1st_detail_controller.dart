// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing_second_details/add_listing_second_details_screen.dart';

import '../../../models/first_complete_model.dart';
import '../../../services/residences_services.dart';

class AddListingFirstDetailController extends GetxController{
   final String residanceId;
   AddListingFirstDetailController(this.residanceId);
  bool electricitySelected=true;
  bool gas=false;
  bool water=false;
  List<String> utilitesSelected=["electricity"];
  ScrollController scroll= ScrollController();
  TextEditingController neighborhoodController=TextEditingController();
  final List <String> msZoning=[
    "agricultural",
    "Commercial",
    "industrial",
    "floating village"
  ];
  int selectedMsZoningIndex=0;
  String msZoningSelected="agricultural";
  final List <String> SaleCondition=[
    "normal",
    "abnormal",
    "Adjoining land purshase",
    "Allocation"
  ];
   int selectedSaleConditionIndex=0;
   String SaleConditionSelected="normal";
  final TextEditingController monthOfSoldController=TextEditingController();
  final  formkey =  GlobalKey<FormState>();
  final TextEditingController sellPriceController=TextEditingController();

final List<String> paymentPeriod=[
  "monthly",
  "yearly"
];
  int selectedPaymentPeriodIndex=0;
  String paymentPeriodSelected="monthly";
  final List<String> saleType=[
    "conventional",
    "cash",
    "va-Loan",
    "new",
    "court officer deed/estate",
    "contract Low-Interest",
    "contract 15% Down payment regular terms",
    "Contract Low Down payment and low intere"
    "contract Low Down",
    "Other"
  ];
  String? selectedValue;
  String saleTypeSelected="conventional";
  final List<String> utilities=[
    "Electricity",
    "gas",
    "water"
  ];
  int selectedUtilitiesIndex=0;
  String utilitySelected="Electricity";
  final List<String> lotShape=[
    "regular",
    "irregular",
    "moderately"
  ];
  int selectedLotShapeIndex=0;
  String lotShapeSelected="regular";
  final List<String> electricity=[
    "average",
    "poor",
    "fair",
    "mixed",
    "standard circuit breakers & romex",
  ];
   String NeighbourhoodSelected="regular";
   String? selectedValue3;
   final List<String>Neighbourhood=[
     "Bloomington Heights",
     "Bluestem",
     "Briardale",
     "Brookside",
     "Clear Creek",
     "College Creek",
     "Crawford",
     "Edwards",
     "Gilbert",
     "Iowa DOT and Rail Road",
     "Meadow Village",
     "Mitchell",
     "North Ames",
     "Northridge",
     "Northpark Villa",
     "South & West of Iowa State University",
     "Sawyer",
     "Sawyer West",
     "Somerset",
     "Stone Brook",
     "Timberland",
     "Veenker"
   ];
  String? selectedValue1;
String electricityLevelSelected="average";
  final List<String> foundation=[
    "slab",
    "stone",
    "Wood",
    "brick and tile",
    "poured contrete'"
  ];
  String foundationSelected="slab";
  int selectedFoundationIndex=0;
  final List<String> buildingType=[
    "single family",
    "duplex",
    "townhouse end unit",
    "townhouse inside unit",
    "2 family conversion"
  ];
  int selectedBuildingTypeIndex=0;
  String buildingTypeSelected="single family";
  Future<void> firstComplete(String neighborhood,String mszoning,
      String saleCondition,int moSold,int salePrice,
      String paymentPeriod,String saleType,
      List<String> utilities,
      String lotShape,
      String electrical,
      String foundation,
      String bldgType
      ,BuildContext context,
      ) async {
    try {
      FirstCompleteModel? data = await ResidenceServices.FirstComplete(
          NeighbourhoodSelected,
       msZoningSelected,
          SaleConditionSelected,
           int.parse(monthOfSoldController.text),
        int.parse(sellPriceController.text),
        paymentPeriodSelected,
        saleTypeSelected,
        utilitesSelected,
        lotShapeSelected,
        electricityLevelSelected,
        foundationSelected,
        buildingTypeSelected,
        context,
          residanceId
      );
      if (data?.status == "success") {
        Get.to(() =>AddListingSecondDetailsScreen(residanceId:data?.residence?.id??residanceId,));
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