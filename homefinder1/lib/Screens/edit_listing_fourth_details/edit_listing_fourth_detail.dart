import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing/add_listing_screen.dart';
import 'package:homefinder1/Screens/edit_listing_fourth_details/controller/edit_listing_fourth_detail_controller.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../Widget/custom_arrow_back.dart';
import '../../Widget/custom_elevated_button_widget.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';


class EditListingFourthDetailsScreen extends StatefulWidget {
  const EditListingFourthDetailsScreen({super.key, required this.residanceId});
  final String residanceId;

  @override
  State<EditListingFourthDetailsScreen> createState() => _EditListingFourthDetailsScreenState();
}

class _EditListingFourthDetailsScreenState extends State<EditListingFourthDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EditListingFourthDetailsController>(
        init: EditListingFourthDetailsController(widget.residanceId),
        builder: (EditListingFourthDetailsController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height*0.1,
              leadingWidth: Get.width * 0.25,
              leading: CustomArrowBack(),
              title: Text(
                "Edit Listing",
                style: TextStyle(
                    color: kVeryDarkBlueColor,
                    fontFamily: kRegularFont,
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                ),
              ),

            ),
            body: Container(
              width: Get.width,
              height: Get.height-Get.height*0.18,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: controller.scroll,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,top: 15),
                      child: Text("Lot config",
                        style: TextStyle(
                            color: kVeryDarkBlueColor,
                            fontFamily: kRegularFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w900
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12,top: 15,bottom: 10),
                      width: Get.width,
                      height: Get.height*0.065,
                      child: ListView.separated(
                          controller: controller.scroll,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(onTap: (){
                              controller.selectedLotConfigIndex=index;
                              setState(() {

                              });
                            },child: Container(
                              height: Get.height*0.05,
                              decoration: BoxDecoration(
                                color: controller.selectedLotConfigIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                                child: Center(child: Text(controller.lotConfig[index], style: TextStyle(
                                    color: controller.selectedLotConfigIndex==index?Colors.white:kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                ),),),
                              ),
                            ));
                          }, separatorBuilder: (context, index) {
                        return SizedBox(width: Get.width*0.02,);
                      }, itemCount: controller.lotConfig.length ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,top: 15),
                      child: Text("Land contour",
                        style: TextStyle(
                            color: kVeryDarkBlueColor,
                            fontFamily: kRegularFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w900
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12,top: 15,bottom: 10),
                      width: Get.width,
                      height: Get.height*0.065,
                      child: ListView.separated(
                          controller: controller.scroll,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(onTap: (){
                              controller.selectedLandContourIndex=index;
                              setState(() {

                              });
                            },child: Container(
                              height: Get.height*0.05,
                              decoration: BoxDecoration(
                                color: controller.selectedLandContourIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                                child: Center(child: Text(controller.landContour[index], style: TextStyle(
                                    color: controller.selectedLandContourIndex==index?Colors.white:kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                ),),),
                              ),
                            ));
                          }, separatorBuilder: (context, index) {
                        return SizedBox(width: Get.width*0.02,);
                      }, itemCount: controller.landContour.length ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,top: 15),
                      child: Text("Land slope",
                        style: TextStyle(
                            color: kVeryDarkBlueColor,
                            fontFamily: kRegularFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w900
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12,top: 15,bottom: 10),
                      width: Get.width,
                      height: Get.height*0.065,
                      child: ListView.separated(
                          controller: controller.scroll,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(onTap: (){
                              controller.selectedLandSlopeIndex=index;
                              setState(() {

                              });
                            },child: Container(
                              height: Get.height*0.05,
                              decoration: BoxDecoration(
                                color: controller.selectedLandSlopeIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                                child: Center(child: Text(controller.landSlope[index], style: TextStyle(
                                    color: controller.selectedLandSlopeIndex==index?Colors.white:kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                ),),),
                              ),
                            ));
                          }, separatorBuilder: (context, index) {
                        return SizedBox(width: Get.width*0.02,);
                      }, itemCount: controller.landSlope.length ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,top: 15),
                      child: Text("Paved drive",
                        style: TextStyle(
                            color: kVeryDarkBlueColor,
                            fontFamily: kRegularFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w900
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12,top: 15,bottom: 10),
                      width: Get.width,
                      height: Get.height*0.065,
                      child: ListView.separated(
                          controller: controller.scroll,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(onTap: (){
                              controller.selectedPavedDriveIndex;
                              setState(() {

                              });
                            },child: Container(
                              height: Get.height*0.05,
                              decoration: BoxDecoration(
                                color: controller.selectedPavedDriveIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                                child: Center(child: Text(controller.pavedDrive[index], style: TextStyle(
                                    color: controller.selectedPavedDriveIndex==index?Colors.white:kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                ),),),
                              ),
                            ));
                          }, separatorBuilder: (context, index) {
                        return SizedBox(width: Get.width*0.02,);
                      }, itemCount: controller.pavedDrive.length ),
                    ),
                    Form(
                      key: controller.formkey,
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("pool Area",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.poolAreaController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Overall quality",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.overallQualityontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Overall Condition",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.overallConditionController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Total area",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.totalAreaController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(

                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Total property area",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.totalPropertyAreaController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Lot area",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.lotAreaController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Lot Frontage",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.lotFrontageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(

                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Total square feet",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.totalSquareFeetController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Low quality square feet",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.lowQualitySquareFeetController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(

                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("Value of miscellaneous feature",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.valueOfMiscellaneousFeatureController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(

                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("House age",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.houseAgeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10),
                              child: Text("House remodel age",
                                style: TextStyle(
                                    color: kVeryDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900
                                ),),
                            ),
                            TextFormField(
                              controller: controller.houseRemodelageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F4F8),
                                filled: true,
                                hintText: "10",
                                hintStyle: TextStyle(color: kVeryDarkBlueColor,
                                    fontWeight: FontWeight.w700,fontSize: 12,fontFamily: kRegularFont),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xffF4F4F4),
                                      width: 3,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color(0xff6C63FF),
                                      width: 3,
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Colors.red.shade600,
                                      width: 3,
                                    )
                                ),

                              ),
                            ),

                          ],

                        ),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.1,
                      child: Center(
                        child: Builder(
                          builder: (BuildContext context) { // Ensure access to valid context
                            return CustomElevatedButtonWidget(
                              text: 'Submit',
                              onPressed: () {
                                if(controller.formkey.currentState!.validate()){
                                  controller.fourthEdit(context);
                                  showBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                            width: Get.width,
                                            height: Get.height * 0.55,
                                            decoration: BoxDecoration(
                                                boxShadow: [BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 15
                                                )],
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  topRight: Radius.circular(50),
                                                )
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: Get.width * 0.15,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff53587A)
                                                  ),
                                                ),
                                                Container(
                                                  child: Image(
                                                    image: AssetImage("lib/assets/images/SuccessfullyIllustration.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Your listing is now ",
                                                      style: TextStyle(
                                                          color: kDarkBlueColor,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 25,
                                                          fontFamily: kRegularFont
                                                      ),
                                                    ),
                                                    Text(
                                                      "published",
                                                      style: TextStyle(
                                                          color: Color(0xff1F4C6B),
                                                          fontFamily: kRegularFont,
                                                          fontSize: 25,
                                                          fontWeight: FontWeight.w900
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    CustomElevatedButtonWidget(
                                                      text: "Add More",
                                                      onPressed: (){
                                                        Get.to(()=>AddListing());
                                                      },
                                                      textStyle: TextStyle(
                                                          color: kDarkBlueColor,
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 16,
                                                          fontFamily: kRegularFont
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          fixedSize: Size(Get.width*0.4, Get.height*0.08),
                                                          backgroundColor: Color(0xffF5F4F8),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20)
                                                          )
                                                      ),
                                                    ),
                                                    CustomElevatedButtonWidget(
                                                      text: "Finish",
                                                      onPressed: (){
                                                        Get.to(()=>HomeScreen());

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
                                          ),
                                        );
                                      }
                                  );
                                }
                              },
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: kRegularFont,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900
                              ),
                              style: ElevatedButton.styleFrom(

                                  backgroundColor: kPrimaryColor,
                                  fixedSize: Size(Get.width * 0.45, Get.height * 0.06),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                            );
                          },
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          );});
  }
}
