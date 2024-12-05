

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:homefinder1/Screens/edit_listing/controller/edit_listing_controller.dart';
import 'package:homefinder1/Screens/test.dart';


import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import '../../utilities/constants.dart';
import '../add listing - photos/widget/grid_view.dart';



class EditListingScreen extends StatefulWidget {
String resId;
EditListingScreen(this.resId);


  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {



  final List gridview = [
    {
      "image": "lib/assets/images/Shape1.png",
    },
    {
      "image": "lib/assets/images/Shape2.png",
    },
    {
      "image": "lib/assets/images/Shape3.png",
    }
  ];

  final List gridview1 = [
    {
      "image": "lib/assets/images/Bed.png",
      "number": "2",
    },
    {
      "image": "lib/assets/images/Bed.png",
      "number": "3",
    },
    {
      "image": "lib/assets/images/Bed.png",
      "number": "4",
    },
    {
      "image": "lib/assets/images/Bed.png",
      "number": "5",
    },
    {
      "image": "lib/assets/images/Bed.png",
      "number": "6",
    },
  ];


  var selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditListingController>(
        init: EditListingController(widget.resId),
        builder: (EditListingController controller) {
          return Scaffold(
            appBar: AppBar(
              leading: CustomArrowBack(),
              leadingWidth: Get.width * 0.2,
              toolbarHeight: Get.height * 0.08,
              title: Text(
                "Edit Listing",
                style: TextStyle(
                    fontFamily: kRegularFont,
                    fontWeight: FontWeight.w900,
                    fontSize: 23,
                    color: kDarkBlueColor),
              ),
            ),
            body: SingleChildScrollView(
              controller: controller.scroll,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                      width: Get.width * 0.95,
                      height: Get.height * 0.15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 0),
                                blurRadius: 10)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                              width: 105,
                              height: 115,
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image:
                                    NetworkImage(
                                        controller.residence?.images?[0].url??
                                            "https://www.thehouseplanshop.com/userfiles/photos/large/181232894dcbf09622300.jpg"),
                                    height: 115,
                                    fit: BoxFit.fill,
                                  ),
                                ),

                              ])),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: Get.width * 0.65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,

                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffEEA651),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          "${controller.residence?.avgRating ??
                                              0}",
                                          style: TextStyle(
                                              color: kGreyColor,
                                              fontFamily: kRegularFont,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F6F9),
                                          border: Border.all(
                                            color: Color(0xffF4F6F9),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25)),
                                      child: Center(
                                        child: Text(
                                          controller.residence?.category ??
                                              "House",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: kRegularFont),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    controller.residence?.title ?? "Home 1002",
                                    style: TextStyle(
                                        color: kDarkBlueColor,
                                        fontFamily: kRegularFont,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xff415770),
                                    size: 17,
                                  ),
                                  Text(
                                    "${controller.residence?.location?.city ??
                                        "California"},"
                                        " ${controller.residence?.location
                                        ?.state ?? "USA"}"
                                    ,
                                    style: TextStyle(
                                        color: Color(0xff415770),
                                        fontSize: 12,
                                        fontFamily: kRegularFont,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\$${controller.residence?.salePrice ??
                                        340}/month",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        fontFamily: kRegularFont),
                                  ),
                                  SizedBox(
                                    width: 135,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: Get.width * 0.34,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "Listing Title",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: kRegularFont,
                              color: kDarkBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: Get.height * 0.15,
                        width: Get.width * 0.93,
                        child: TextField(
                          controller: controller.propertyTitle,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(top: Get.height * 0.075),
                            filled: true,
                            fillColor: Color(0xffF4F4F4),
                            hintText: "      Schoolview House",
                            hintStyle: TextStyle(

                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),

                            suffixIcon: Image(
                                image: AssetImage(
                                    'lib/assets/images/House.png')),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Color(0xffF4F4F4),
                                  width: 3,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Color(0xff6C63FF),
                                  width: 3,
                                )),
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Listing type",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        ),
                      ),
                    ),

                    Container(
                      width: Get.width,
                      height: Get.height * 0.1,
                      padding: const EdgeInsets.only(
                          top: 17, bottom: 17, left: 12),
                      child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedIndex1 = index;
                              setState(() {

                              });
                              if (controller.selectedIndex1 == 0) {
                                controller.propertyType = "rent";
                              } else if (controller.selectedIndex1 == 1) {
                                controller.propertyType = "sale";
                              }
                            },
                            child: Container(
                              width: 73,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex1 == index
                                      ? kPrimaryColor
                                      : kLightGreyColor,
                                  border: Border.all(
                                      color: controller.selectedIndex1 == index
                                          ? kPrimaryColor
                                          : kLightGreyColor, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                    controller.rOrS[index],
                                    style: TextStyle(
                                        color: controller.selectedIndex1 ==
                                            index
                                            ? Colors.white
                                            : kDarkBlueColor,
                                        fontFamily: kRegularFont,
                                        fontWeight: controller.selectedIndex1 ==
                                            index ? FontWeight.w800 : FontWeight
                                            .w500,
                                        fontSize: 12),
                                  )),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        itemCount: controller.rOrS.length,),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Property category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        ),
                      ),
                    ),

                    Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.2,
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      child: GridView.builder(
                        controller: controller.scroll,

                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:
                            (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedIndex2 = index;
                              setState(() {

                              });
                              if (controller.selectedIndex2 == 0) {
                                controller.propertyCategory = "house";
                              } else if (controller.selectedIndex2 == 1) {
                                controller.propertyCategory = "apartment";
                              } else if (controller.selectedIndex2 == 2) {
                                controller.propertyCategory = "hotel";
                              } else if (controller.selectedIndex2 == 3) {
                                controller.propertyCategory = "villa";
                              } else {
                                controller.propertyCategory = "cottage";
                              }
                            },
                            child: Container(
                              width: 93,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex2 == index
                                      ? kPrimaryColor
                                      : kLightGreyColor,
                                  border: Border.all(
                                      color: controller.selectedIndex2 == index
                                          ? kPrimaryColor
                                          : kLightGreyColor, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                    controller.hOrAOrHOrVOrC[index],
                                    style: TextStyle(
                                        color: controller.selectedIndex2 ==
                                            index
                                            ? Colors.white
                                            : kDarkBlueColor,
                                        fontFamily: kRegularFont,
                                        fontWeight: controller.selectedIndex2 ==
                                            index ? FontWeight.w800 : FontWeight
                                            .w500,
                                        fontSize: 13),
                                  )),
                            ),
                          );
                        },
                        itemCount: 5,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 52,
                        ),),
                    ),


                    Center(
                      child: Container(
                        height: 450,
                        color: Color(0xffF7F7F7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            controller: controller.scroll,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                mainAxisExtent: 200),
                            itemCount: controller.gridview.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GridView1(

                                gridView: controller.gridview,
                                index: index,
                                OnTap: () {},);
                            },
                          ),
                        ),
                      ),
                    ),


                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        width: 210,
                        height: 64,
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
                              controller.updateResidance(
                                  controller.propertyTitle.text,
                                  controller.propertyType,
                                  controller.propertyCategory,
                                  context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                fixedSize: Size(200, 70))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

