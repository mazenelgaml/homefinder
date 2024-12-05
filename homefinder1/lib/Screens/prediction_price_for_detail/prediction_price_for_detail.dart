import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/prediction_price_for_detail/controller/prediction_price_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

class PredictionPriceForDetail extends StatefulWidget {
   PredictionPriceForDetail({super.key,required this.resId});
String resId;
  @override
  State<PredictionPriceForDetail> createState() => _PredictionPriceForDetailState();
}

class _PredictionPriceForDetailState extends State<PredictionPriceForDetail> {

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PredictionPriceForDetailController>(
        init: PredictionPriceForDetailController(widget.resId,context),
    builder: (PredictionPriceForDetailController controller) {
    return Scaffold(
      appBar: AppBar(
       leading: CustomArrowBack(),
        leadingWidth: Get.width*0.3,
        toolbarHeight: Get.height*0.15,
      ),body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Center(
              child: Container(
                child: Image(
                  image: AssetImage(
                    "lib/assets/images/!.png"
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width*0.7,
                child: Text(
                  "Check the predicted ",
                  style: TextStyle(
                    color: kDarkBlueColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: kRegularFont
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width*0.4,
                child: Text(
                  "price for this ",
                  style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: kRegularFont
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width*0.29,
                child: Text(
                  "Property",
                  style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontFamily: kRegularFont
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: Get.height*0.37,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButtonWidget(
                  text: "Show",
                  onPressed: (){
                  controller.showBottomSheet(140700,context);
                   setState(() {

                   });
                  }, textStyle: TextStyle(
                color: Colors.white,
                fontFamily: kRegularFont,
                fontWeight: FontWeight.w800,
                fontSize: 15
              ), style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                fixedSize: Size(Get.width*0.4, Get.height*0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              )),
            ],
          ),
        )
      ],
    ),
    );});
  }
}
