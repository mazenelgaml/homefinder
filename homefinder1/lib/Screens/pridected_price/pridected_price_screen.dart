// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/edit_listing/edit_listing_screen.dart';
import 'package:homefinder1/Screens/editi_listing_first_deatil_screen/edit_listing_first_detail_screen.dart';
import 'package:homefinder1/Screens/pridected_price/controller/predict_price_controller.dart';
import 'package:homefinder1/Screens/profile/controller/profile_controller.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../Widget/custom_elevated_button_widget.dart';
import '../home/home_screen.dart';

class PredictPriceScreen extends StatelessWidget {
  String resId;
  PredictPriceScreen({super.key,required this.resId});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PredictPriceController>(
        init: PredictPriceController(context,resId),
    builder: (PredictPriceController controller) {
    return  Scaffold(
      body: Column(
crossAxisAlignment: CrossAxisAlignment.center,

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: Get.height*0.32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image:
                        AssetImage("lib/assets/images/SuccessfullyIllustration.png"),
                  ),
                  Column(
                    children: [
                      Container(

                        width: Get.width*0.88 ,
                        child: Center(
                          child: Text(
                            "Your listing is now published! Check out the predicted price",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Center(
                        child: Text("below",
                          style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, -12),
                blurRadius: 15
              )]
            ),
            child: Center(
              child: Text("\$"+"${controller.predictedPrice}",style: TextStyle(
    color: kPrimaryColor,
    fontFamily: kRegularFont,
    fontSize: 22,
    fontWeight: FontWeight.w600),),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButtonWidget(
                text: "Change Price",
                onPressed: (){
                Get.to(()=>EditListingFirstDetailScreen(residanceId: resId));
                },
                textStyle: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    fontFamily: kRegularFont
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width*0.4, Get.height*0.08),
                    backgroundColor: const Color(0xffF5F4F8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              CustomElevatedButtonWidget(
                text: "Finish",
                onPressed: (){
    bool test4 = Get.isRegistered<ProfileController>();
    if(test4){
    Get.delete<ProfileController>();
   }
                  Get.to(()=>const HomeScreen());

                },
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    fontFamily: kRegularFont
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width*0.4, Get.height*0.08),
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              )
            ],
          )
        ],
      ),
    );});
  }
}
