// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/price_prediction_model.dart';

import '../../../services/residences_services.dart';

class PredictPriceController extends GetxController{
  @override
  void onInit() async{
    super.onInit();
    await predictResidencePrice(context);
  }
  BuildContext context;
  PredictPriceController(this.context,this.resId);
  String resId;
  PricePeridectionModel?price;
  int? predictedPrice;
  bool isLoading=true;
  predictResidencePrice(BuildContext context) async {
    try {
      PricePeridectionModel? response = await ResidenceServices.pricePrediction( resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        price = response;
        predictedPrice=price?.predictedPrice;
        print("hiiiiiiiiiiiiiiiii");


        // Print or access other properties as needed
        print("Number of residences: ${ response.predictedPrice}");
      }


    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
      update();
    }

  }

}