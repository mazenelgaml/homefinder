// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../Widget/custom_arrow_back.dart';
import 'controller/add_listing_controller.dart';

class AddListing extends StatefulWidget {

   const AddListing({super.key});


  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: AddListingController(),
    builder: (AddListingController controller) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scroll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.width * 0.13),
            Row(
              children: [
                const CustomArrowBack(),
                SizedBox(
                  width: Get.width * 0.1,
                ),
                Text(
                  "Add Listing",
                  style: TextStyle(
                      fontFamily: kRegularFont,
                      fontWeight: FontWeight.w900,
                      fontSize: 23,
                      color: kDarkBlueColor),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.09,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text(
                  " Fill detail of your ",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: kRegularFont,
                      fontWeight: FontWeight.w600,
                      color: kDarkBlueColor),
                ),
                Text(
                  "real estate ",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: kDarkBlueColor,
                      fontFamily: kRegularFont),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Container(
                height: Get.height * 0.15,
                width: Get.width * 0.87,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: controller.propertyTitle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: Get.height * 0.075),
                    filled: true,
                    fillColor: const Color(0xffF4F4F4),
                    hintText: "      The Lodge House",
                    hintStyle: TextStyle(
                        color: kDarkBlueColor,
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                    suffixIcon: const Image(
                        image:
                            AssetImage('lib/assets/images/HouseSerchIcon.png')),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 3,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff6C63FF),
                          width: 3,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Listing type",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: kRegularFont,
                  color: kDarkBlueColor,
                ),
              ),
            ),

            Container(
              width: Get.width,
              height: Get.height*0.1,
              padding: const EdgeInsets.only(top: 17,bottom: 17,left: 12),
              child: ListView.separated(
                controller: controller.scroll,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
               return InkWell(
                  onTap: () {
                  controller.selectedIndex1=index;
                  setState(() {

                  });
                  if (controller.selectedIndex1==0){
                    controller.propertyType="rent";
                  } else if(controller.selectedIndex1==1){
                    controller.propertyType="sale";
                  }
                  },
                  child: Container(
                    width: 73,
                    height: 50,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex1==index?kPrimaryColor:kLightGreyColor,
                        border: Border.all(color: controller.selectedIndex1==index?kPrimaryColor:kLightGreyColor, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                          controller.rOrS[index],
                          style: TextStyle(
                              color: controller.selectedIndex1==index?Colors.white:kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight:  controller.selectedIndex1==index?FontWeight.w800:FontWeight.w500,
                              fontSize: 12),
                        )),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
               return const SizedBox(
                  width:15,
                );
              }, itemCount: controller.rOrS.length,),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Property category",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: kRegularFont,
                  color: kDarkBlueColor,
                ),
              ),
            ),

      Container(
        width: Get.width*0.7,
        height: Get.height*0.2,
        margin: const EdgeInsets.only(left: 15,top: 15),
        child: GridView.builder(
            controller: controller.scroll,

            physics: const NeverScrollableScrollPhysics(),
          itemBuilder:
            (context,index){
          return InkWell(
            onTap: () {
                controller.selectedIndex2=index;
                setState(() {

                });
                if(controller.selectedIndex2==0){
                  controller.propertyCategory="house";
                }else if(controller.selectedIndex2==1){
                  controller.propertyCategory="apartment";
                }else if(controller.selectedIndex2==2){
                  controller.propertyCategory="hotel";
                }else if(controller.selectedIndex2==3){
                  controller.propertyCategory="villa";
                }else{
                  controller.propertyCategory="cottage";
                }
            },
            child: Container(
              width: 93,
              height: 50,
              decoration: BoxDecoration(
                  color: controller.selectedIndex2==index?kPrimaryColor:kLightGreyColor,
                  border: Border.all(color: controller.selectedIndex2==index?kPrimaryColor:kLightGreyColor, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                    controller.hOrAOrHOrVOrC[index],
                    style: TextStyle(
                        color: controller.selectedIndex2==index?Colors.white:kDarkBlueColor,
                        fontFamily: kRegularFont,
                        fontWeight: controller.selectedIndex2==index?FontWeight.w800:FontWeight.w500,
                        fontSize: 12),
                  )),
            ),
          );
            },
            itemCount: 5, gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        mainAxisExtent: 52,
        ),),
      ),


            Center(
              child: Container(
                width: 210,
                height: 64,
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(color: kPrimaryColor, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: kRegularFont,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      controller.createResidance(controller.propertyTitle.text,
                          controller.propertyType, controller.propertyCategory, context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        fixedSize: const Size(200, 70))),
              ),
            )
          ],
        ),

      ),
    );});

  }
}
