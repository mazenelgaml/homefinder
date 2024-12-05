import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing_1st_detail/add_listing_1st_detail_screen.dart';
import 'package:homefinder1/Screens/add_listing_3rd_detail/controller/add_listing_3rd_detail_controller.dart';
import 'package:homefinder1/Screens/add_listing_fourth_details/add_listing_fourth_details_screen.dart';
import 'package:homefinder1/Screens/edit_listing_third_detail/controller/edit_listing_third_detail_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../utilities/colors.dart';

class EditListingThirdDetailsScreen extends StatefulWidget {
  const EditListingThirdDetailsScreen({super.key , required this.residanceId});
  final String residanceId;

  @override
  State<EditListingThirdDetailsScreen> createState() =>
      _EditListingThirdDetailsScreenState();
}

class _EditListingThirdDetailsScreenState
    extends State<EditListingThirdDetailsScreen> {
  String groupValue = "yes";
  String groupValue1 = "yes";
  String groupValue2 = "yes";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditListingThirdDetailsController>(
        init: EditListingThirdDetailsController(widget.residanceId),
        builder: (EditListingThirdDetailsController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height * 0.1,
              leadingWidth: Get.width * 0.25,
              leading: CustomArrowBack(),
              title: Text(
                "Edit Listing",
                style: TextStyle(
                    color: kVeryDarkBlueColor,
                    fontFamily: kRegularFont,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            body: SingleChildScrollView(
              controller: controller.scroll,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 200,
                      ),
                      Text(
                        "Yes",
                        style: TextStyle(fontSize: 18, color: kGreyColor),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text("No",
                          style: TextStyle(fontSize: 18, color: kGreyColor)),
                    ],
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Has garage",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Radio(
                        value: "yes",
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value!;
                          });
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: "no",
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value!;
                          });
                        })
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Garage Type",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedGarageTypeIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.selectedGarageTypeIndex ==
                                      index
                                      ? kPrimaryColor
                                      : Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.garageType[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedGarageTypeIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.garageType.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Garage Quality",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedGarageQualityIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                  controller.selectedGarageQualityIndex ==
                                      index
                                      ? kPrimaryColor
                                      : const Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.garageQuality[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedGarageQualityIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.garageQuality.length),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Garage cars",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounter1();
                            },
                            child: const Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.counter1}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounter1();
                              },
                              child:const  Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Garage Finish",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics:const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedGarageFinishIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.selectedGarageFinishIndex ==
                                      index
                                      ? kPrimaryColor
                                      :const  Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.garageQuality[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedGarageFinishIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.garageFinish.length),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.57,
                      ),
                      Text(
                        "Yes",
                        style: TextStyle(fontSize: 18, color: kGreyColor),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text("No",
                          style: TextStyle(fontSize: 18, color: kGreyColor)),
                    ],
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Has Basement",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Radio(
                        value: "yes",
                        groupValue: groupValue1,
                        onChanged: (value) {
                          setState(() {
                            groupValue1 = value!;
                          });
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: "no",
                        groupValue: groupValue1,
                        onChanged: (value) {
                          setState(() {
                            groupValue1 = value!;
                          });
                        })
                  ]),
                  Form(
                    key: controller.formkey,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              "Unfinished square feet of basement area",
                              style: TextStyle(
                                  color: kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          TextFormField(
                            controller: controller.basementAreaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(0xffF5F4F8),
                              filled: true,
                              hintText: "10",
                              hintStyle: TextStyle(
                                  color: kVeryDarkBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  fontFamily: kRegularFont),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:const BorderSide(
                                    color: Color(0xffF4F4F4),
                                    width: 3,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:const BorderSide(
                                    color: Color(0xff6C63FF),
                                    width: 3,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade600,
                                    width: 3,
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade600,
                                    width: 3,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Basement Exposure",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics:const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedBasementExposureIndex =
                                    index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller
                                      .selectedBasementExposureIndex ==
                                      index
                                      ? kPrimaryColor
                                      :const Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.basementExposure[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedBasementExposureIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.basementExposure.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Rating Of Basement",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics:const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedRatingOfBasement = index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.selectedRatingOfBasement ==
                                      index
                                      ? kPrimaryColor
                                      : Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.ratingOfBasement[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedRatingOfBasement ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.ratingOfBasement.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Height Of Basement",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedHeightOfBasementIndex =
                                    index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller
                                      .selectedHeightOfBasementIndex ==
                                      index
                                      ? kPrimaryColor
                                      :const Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.heightOfBasement[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedHeightOfBasementIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.heightOfBasement.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Condition of basement",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedConditionOfBasement = index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                  controller.selectedConditionOfBasement ==
                                      index
                                      ? kPrimaryColor
                                      : const Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.conditionOfBasement[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedConditionOfBasement ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.conditionOfBasement.length),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 210,
                      ),
                      Text(
                        "Yes",
                        style: TextStyle(fontSize: 18, color: kGreyColor),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text("No",
                          style: TextStyle(fontSize: 18, color: kGreyColor)),
                    ],
                  ),
                  Row(children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Has fire place",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Radio(
                        value: "yes",
                        groupValue: groupValue2,
                        onChanged: (value) {
                          setState(() {
                            groupValue2 = value!;
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: "no",
                        groupValue: groupValue2,
                        onChanged: (value) {
                          setState(() {
                            groupValue2 = value!;
                          });
                        })
                  ]),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Fire Places",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounter2();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.counter2}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounter2();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Fire Place Quality",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedFirePlaceQualityIndex =
                                    index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller
                                      .selectedFirePlaceQualityIndex ==
                                      index
                                      ? kPrimaryColor
                                      : Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.firePlaceQuality[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedFirePlaceQualityIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.firePlaceQuality.length),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Bedroom",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounterBedroom();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.counterBedroom}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounterBedroom();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Bathroom",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounterBathroom();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.counterBathroom}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounterBathr0om();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Kitchen",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: Get.width * 0.39,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounterKitchen();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.counterKitchen}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounterKitchen();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "   Kitchen Quality",
                          style: TextStyle(
                              color: kVeryDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedKitchenQualityIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                  controller.selectedKitchenQualityIndex ==
                                      index
                                      ? kPrimaryColor
                                      : Color(0xffF5F4F8),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 12,
                                      bottom: 12),
                                  child: Center(
                                    child: Text(
                                      controller.kitchenQuality[index],
                                      style: TextStyle(
                                          color: controller
                                              .selectedKitchenQualityIndex ==
                                              index
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: Get.width * 0.02,
                          );
                        },
                        itemCount: controller.kitchenQuality.length),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.98,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Rooms without Bathroom",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounterRoomsWithoutBathroom();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.counterRoomWithoutBathroom}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounterRoomsWithoutBathroom();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: Get.height * 0.150,
                    child: Center(
                      child: CustomElevatedButtonWidget(
                        text: 'Next',
                        onPressed: () {
                          if(controller.formkey.currentState!.validate()){
                            controller.thirdedit(context);
                          }
                        },
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: kRegularFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            fixedSize:
                            Size(Get.width * 0.45, Get.height * 0.06),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
