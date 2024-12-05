import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/edit_listing_second_detail/controller/edit_listing_second_detail_controller.dart';

import '../../Widget/custom_arrow_back.dart';
import '../../Widget/custom_elevated_button_widget.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';


class EditListingSecondDetailsScreen extends StatefulWidget {
  const EditListingSecondDetailsScreen({super.key, required this.residanceId});
  final String residanceId;
  @override

  @override
  State<EditListingSecondDetailsScreen> createState() => _EditListingSecondDetailsScreenState();
}

class _EditListingSecondDetailsScreenState extends State<EditListingSecondDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EditListingSecondDetailController>(
        init: EditListingSecondDetailController(widget.residanceId),
        builder: (EditListingSecondDetailController controller) {
          return  Scaffold(
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
            body: SingleChildScrollView(
              controller:controller.scroll ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Roof Style",
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
                            controller.selectedRoofStyleIndex=index;
                            controller.roofStyleSelected=controller.roofStyle[controller.selectedRoofStyleIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedRoofStyleIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.roofStyle[index], style: TextStyle(
                                  color: controller.selectedRoofStyleIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.roofStyle.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Roof Material",
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
                            controller.selectedRoofMaterialIndex=index;
                            controller.roofMaterialSelected=controller.roofMaterial[controller.selectedRoofMaterialIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedRoofMaterialIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.roofMaterial[index], style: TextStyle(
                                  color: controller.selectedRoofMaterialIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.roofMaterial.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("House Style",
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
                            controller.selectedHouseStyleIndex=index;
                            controller.houseStyleSelected=controller.houseStyle[controller.selectedHouseStyleIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedHouseStyleIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.houseStyle[index], style: TextStyle(
                                  color: controller.selectedHouseStyleIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.houseStyle.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                                  'type Of Residence',
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
                          items: controller.typeOfResidence
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
                          value: controller.selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              controller.selectedValue = value;
                              controller.typeOfResidenceSelected=controller.selectedValue!;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height*0.072,
                            width: Get.width*0.9,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 2
                              ),
                              color: Color(0xffffffff),
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
                            width: Get.width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                            ),
                            offset: const Offset(0, 10), // Adjust the offset here
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility: MaterialStateProperty.all<bool>(true),
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
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Central Air",
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
                            controller.selectedCentralAirIndex=index;
                            controller.centralAirSelected=controller.centralAir[controller.selectedCentralAirIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedCentralAirIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.centralAir[index], style: TextStyle(
                                  color: controller.selectedCentralAirIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.centralAir.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Street",
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
                            controller.selectedStreetIndex=index;
                            controller.streetSelected=controller.street[controller.selectedStreetIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedStreetIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.street[index], style: TextStyle(
                                  color: controller.selectedStreetIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.street.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Heating",
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
                            controller.selectedHeatingIndex=index;
                            controller.heatingSelected=controller.heating[controller.selectedHeatingIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedHeatingIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.heating[index], style: TextStyle(
                                  color: controller.selectedHeatingIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.heating.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Heating quality",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12,top: 15,bottom: 5),
                    width: Get.width,
                    height: Get.height*0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(onTap: (){
                            controller.selectedHeatingQualityIndex=index;
                            controller.heatingQualitySelected=controller.heatingQuality[controller.selectedHeatingQualityIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedHeatingQualityIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.heatingQuality[index], style: TextStyle(
                                  color: controller.selectedHeatingQualityIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.heatingQuality.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15,bottom: 15),
                    child: Text("Masonry Veneer Type",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12,bottom: 15),
                    width: Get.width,
                    height: Get.height*0.065,
                    child: ListView.separated(
                        controller: controller.scroll,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(onTap: (){
                            controller.selectedMasonryVeneerTypeIndex=index;
                            controller.masonryVeneerTypeSelected=controller.masonryVeneerType[controller.selectedMasonryVeneerTypeIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedMasonryVeneerTypeIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.masonryVeneerType[index], style: TextStyle(
                                  color: controller.selectedMasonryVeneerTypeIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.masonryVeneerType.length ),
                  ),
                  Form(
                    key: controller.formkey,
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text("Masonry veneer area",
                              style: TextStyle(
                                  color: kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900
                              ),),
                          ),
                          TextFormField(
                            controller: controller.masonryVeneerAreaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(0xffF5F4F8),
                              filled: true,
                              hintText: "152",
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

                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                                  'Exterior covering on house 1',
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
                          items: controller.exteriorCoveringOnHouse1
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
                              controller.exteriorCoveringOnHouse1Selected=controller.selectedValue1!;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height*0.072,
                            width: Get.width*0.9,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 2
                              ),
                              color: Color(0xffffffff),
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
                            width: Get.width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                            ),
                            offset: const Offset(0, 10), // Adjust the offset here
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility: MaterialStateProperty.all<bool>(true),
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
                    padding: const EdgeInsets.all(15.0),
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
                                  'Exterior covering on house 2',
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
                          items: controller.exteriorCoveringOnHouse2
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
                          value: controller.selectedValue2,
                          onChanged: (String? value) {
                            setState(() {
                              controller.selectedValue2 = value;
                              controller.exteriorCoveringOnHouse2Selected=controller.selectedValue2!;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height*0.072,
                            width: Get.width*0.9,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 2
                              ),
                              color: Color(0xffffffff),
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
                            width: Get.width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                            ),
                            offset: const Offset(0, 10), // Adjust the offset here
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility: MaterialStateProperty.all<bool>(true),
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
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Exterior condition",
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
                            controller.selectedExteriorConditionIndex=index;
                            controller.exteriorConditionSelected=controller.exteriorCondition[controller.selectedExteriorConditionIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedExteriorConditionIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.exteriorCondition[index], style: TextStyle(
                                  color: controller.selectedExteriorConditionIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.exteriorCondition.length ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 15),
                    child: Text("Exterior Quality",
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
                            controller.selectedExteriorQualityIndex=index;
                            controller.exteriorQualitySelected=controller.exteriorQuality[controller.selectedExteriorQualityIndex];
                            setState(() {

                            });
                          },child: Container(
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: controller.selectedExteriorQualityIndex==index?kPrimaryColor:Color(0xffF5F4F8),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12,bottom: 12),
                              child: Center(child: Text(controller.exteriorQuality[index], style: TextStyle(
                                  color: controller.selectedExteriorQualityIndex==index?Colors.white:kVeryDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),),
                            ),
                          ));
                        }, separatorBuilder: (context, index) {
                      return SizedBox(width: Get.width*0.02,);
                    }, itemCount: controller.exteriorQuality.length ),
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
                                  'Condition 1',
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
                          items: controller.condition1
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
                              controller.condition1Selected=controller.selectedValue3!;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height*0.072,
                            width: Get.width*0.9,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 2
                              ),
                              color: Color(0xffffffff),
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
                            width: Get.width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                            ),
                            offset: const Offset(0, 10), // Adjust the offset here
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility: MaterialStateProperty.all<bool>(true),
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
                    padding: const EdgeInsets.all(15.0),
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
                                  'Condition 2',
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
                          items: controller.condition2
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
                          value: controller.selectedValue4,
                          onChanged: (String? value) {
                            setState(() {
                              controller.selectedValue4 = value;
                              controller.condition2Selected=controller.selectedValue4!;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height*0.072,
                            width: Get.width*0.9,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 2
                              ),
                              color: Color(0xffffffff),
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
                            width: Get.width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                            ),
                            offset: const Offset(0, 10), // Adjust the offset here
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility: MaterialStateProperty.all<bool>(true),
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
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(bottom: 15),
                    height: Get.height*0.15,
                    child: Center(
                      child: CustomElevatedButtonWidget(text: 'Next', onPressed: () {
                        if(controller.formkey.currentState!.validate()){
                          controller.secondEdit(context);
                        }
                      }, textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: kRegularFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w900
                      ), style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          fixedSize: Size(Get.width*0.5, Get.height*0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),),
                    ),
                  )
                ],
              ),
            ),
          );});
  }
}
