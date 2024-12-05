// ignore_for_file: avoid_print

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../Widget/custom_elevated_button_widget.dart';
import 'controller/add_listing_1st_detail_controller.dart';

class AddListingFirstDetailScreen extends StatefulWidget {
  const AddListingFirstDetailScreen({super.key, required this.residanceId});
final String residanceId;
  @override
  State<AddListingFirstDetailScreen> createState() =>
      _AddListingFirstDetailScreenState();
}

class _AddListingFirstDetailScreenState
    extends State<AddListingFirstDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddListingFirstDetailController>(
        init: AddListingFirstDetailController(widget.residanceId),
        builder: (AddListingFirstDetailController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height * 0.1,
              leadingWidth: Get.width * 0.25,
              leading: const CustomArrowBack(),
              title: Text(
                "Add Listing",
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Text(
                      "MsZoning",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedMsZoningIndex = index;
                                controller.msZoningSelected = controller
                                    .msZoning[controller.selectedMsZoningIndex];
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedMsZoningIndex == index
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
                                      controller.msZoning[index],
                                      style: TextStyle(
                                          color: controller
                                                      .selectedMsZoningIndex ==
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
                        itemCount: controller.msZoning.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Text(
                      "Sale condition",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedSaleConditionIndex = index;
                                controller.SaleConditionSelected =
                                    controller.SaleCondition[
                                        controller.selectedSaleConditionIndex];
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedSaleConditionIndex ==
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
                                      controller.SaleCondition[index],
                                      style: TextStyle(
                                          color: controller
                                                      .selectedSaleConditionIndex ==
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
                        itemCount: controller.SaleCondition.length),
                  ),
                  Form(
                    key: controller.formkey,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: const Row(
                                    children: [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Neighbourhood',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff313144),
                                          ),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: controller.Neighbourhood
                                      .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff313144),
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ))
                                      .toList(),
                                  value: controller.selectedValue3,
                                  onChanged: (String? value) {
                                    setState(() {
                                      controller.selectedValue3 = value;
                                      controller.NeighbourhoodSelected =
                                          controller.selectedValue3?? "colleg creek";
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: Get.height * 0.07,
                                    width: Get.width * 0.9,
                                    padding: const EdgeInsets.only(left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.black26, width: 2),
                                      color: const Color(0xffffffff),
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                    ),
                                    iconSize: 25,
                                    iconEnabledColor: Color(0xff313144),
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    width: Get.width * 0.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    offset: const Offset(0, 10),
                                    // Adjust the offset here
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness: WidgetStateProperty.all<double>(6),
                                      thumbVisibility:
                                      WidgetStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              "Month of sold",
                              style: TextStyle(
                                  color: kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          TextFormField(
                            controller: controller.monthOfSoldController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffF5F4F8),
                              filled: true,
                              hintText: "12",
                              hintStyle: TextStyle(
                                  color: kDarkBlueColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: kRegularFont),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: Color(0xffF4F4F4),
                                    width: 3,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              "Sell Price",
                              style: TextStyle(
                                  color: kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          TextFormField(
                            controller: controller.sellPriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.attach_money_outlined,
                                size: 20,
                                color: kVeryDarkBlueColor,
                              ),
                              fillColor: const Color(0xffF5F4F8),
                              filled: true,
                              hintText: "\$ 180,000",
                              hintStyle: TextStyle(
                                  color: kDarkBlueColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: kRegularFont),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: Color(0xffF4F4F4),
                                    width: 3,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
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
                    child: Text(
                      "Payment period",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedPaymentPeriodIndex = index;
                                controller.paymentPeriodSelected =
                                    controller.paymentPeriod[
                                        controller.selectedPaymentPeriodIndex];
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedPaymentPeriodIndex ==
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
                                      controller.paymentPeriod[index],
                                      style: TextStyle(
                                          color: controller
                                                      .selectedPaymentPeriodIndex ==
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
                        itemCount: controller.paymentPeriod.length),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Text(
                      "Utilities",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                      width: Get.width,
                      height: Get.height * 0.065,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                if (controller.electricitySelected == true) {
                                  controller.electricitySelected = false;
                                  controller.utilitesSelected
                                      .remove("electricity");
                                } else {
                                  controller.electricitySelected = true;
                                  controller.utilitesSelected
                                      .add("electricity");
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.electricitySelected == true
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
                                      "electricity",
                                      style: TextStyle(
                                          color:
                                              controller.electricitySelected ==
                                                      true
                                                  ? Colors.white
                                                  : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          InkWell(
                              onTap: () {
                                if (controller.gas == true) {
                                  controller.gas = false;
                                  controller.utilitesSelected.remove("gas");
                                } else {
                                  controller.gas = true;
                                  controller.utilitesSelected.add("gas");
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.gas == true
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
                                      "gas",
                                      style: TextStyle(
                                          color: controller.gas == true
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          InkWell(
                              onTap: () {
                                if (controller.water == true) {
                                  controller.water = false;
                                  controller.utilitesSelected.remove("water");
                                } else {
                                  controller.water = true;
                                  controller.utilitesSelected.add("water");
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.water == true
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
                                      "water",
                                      style: TextStyle(
                                          color: controller.water == true
                                              ? Colors.white
                                              : kVeryDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Text(
                      "Lot-shape(General shape of property)",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedLotShapeIndex = index;
                                controller.lotShapeSelected = controller
                                    .lotShape[controller.selectedLotShapeIndex];
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedLotShapeIndex == index
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
                                      controller.lotShape[index],
                                      style: TextStyle(
                                          color: controller
                                                      .selectedLotShapeIndex ==
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
                        itemCount: controller.lotShape.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: const Row(
                            children: [
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Electricity',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff313144),
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          items: controller.electricity
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff313144),
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ))
                              .toList(),
                          value: controller.selectedValue1,
                          onChanged: (String? value) {
                            setState(() {
                              controller.selectedValue1 = value;
                              controller.electricityLevelSelected =
                                  controller.selectedValue1?? "average";
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height * 0.07,
                            width: Get.width * 0.9,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.black26, width: 2),
                              color: const Color(0xffffffff),
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                            ),
                            iconSize: 25,
                            iconEnabledColor: Color(0xff313144),
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffffffff),
                            ),
                            offset: const Offset(0, 10),
                            // Adjust the offset here
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: WidgetStateProperty.all<double>(6),
                              thumbVisibility:
                                  WidgetStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Text(
                      "Foundation",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedFoundationIndex = index;
                                controller.foundationSelected =
                                    controller.foundation[
                                        controller.selectedFoundationIndex];
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.selectedFoundationIndex ==
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
                                      controller.foundation[index],
                                      style: TextStyle(
                                          color: controller
                                                      .selectedFoundationIndex ==
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
                        itemCount: controller.foundation.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15),
                    child: Text(
                      "Building Type",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedBuildingTypeIndex = index;
                                controller.buildingTypeSelected =
                                    controller.buildingType[
                                        controller.selectedBuildingTypeIndex];
                                setState(() {});
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  color: controller.selectedBuildingTypeIndex ==
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
                                      controller.buildingType[index],
                                      style: TextStyle(
                                          color: controller
                                                      .selectedBuildingTypeIndex ==
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
                        itemCount: controller.buildingType.length),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.only(bottom: 15),
                    height: Get.height * 0.15,
                    child: Center(
                      child: CustomElevatedButtonWidget(
                        text: 'Next',
                        onPressed: () {
                          print("hiiiiiiii");
                          print(widget.residanceId);
                          if (controller.formkey.currentState!.validate()) {
                            controller.firstComplete(
                                controller.neighborhoodController.text,
                                controller.msZoningSelected,
                                controller.SaleConditionSelected,
                                int.parse(
                                    controller.monthOfSoldController.text),
                                int.parse(controller.sellPriceController.text),
                                controller.paymentPeriodSelected,
                                controller.saleTypeSelected,
                                controller.utilitesSelected,
                                controller.lotShapeSelected,
                                controller.electricityLevelSelected,
                                controller.foundationSelected,
                                controller.buildingTypeSelected,
                                context,
                            );
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
