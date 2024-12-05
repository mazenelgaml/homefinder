import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../models/price_prediction_model.dart';
import '../../../services/residences_services.dart';
import '../../../utilities/colors.dart';

class PredictionPriceForDetailController extends GetxController{
  String resId;
  BuildContext context;
  PredictionPriceForDetailController(this.resId,this.context);
  void onInit(){
    super.onInit();
   predictResidencePrice(resId, context);
  }
  PricePeridectionModel?price;
  int? predictedPrice;
  bool isLoading=true;
  predictResidencePrice(resId,BuildContext context) async {
    try {
      PricePeridectionModel? response = await ResidenceServices.pricePrediction( resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        price = response;
        predictedPrice=price?.predictedPrice;
        print(predictedPrice);
        print("hiiiiiiiiiiiiiiiii");
        predictedPrice=response.predictedPrice;


        // Print or access other properties as needed
        print("Number of residences: $predictedPrice");
      }


    } catch (e) {
      print("Exception occurred: $e");

    }
    isLoading = false;
    update();
  }
  void  showBottomSheet(int predicted,BuildContext context)async{
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) =>
          DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) =>
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical:5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(
                              10),
                        ),
                      ),
                      Text(
                        'Predicted price',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical:10, horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                              20),
                        ),
                        child: Text(
                          '\$${predictedPrice}',
                          style: TextStyle(
                            fontSize: 30,
                            color: kVeryVioletColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              backgroundColor: Colors
                                  .grey[300],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                title: "Sucess",
                                text: "House booked Successfully",
                              );
                            },
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              backgroundColor:kVeryVioletColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          ),
    );}

}