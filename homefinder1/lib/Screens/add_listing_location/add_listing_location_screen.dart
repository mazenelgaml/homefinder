import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import 'location_map_screen.dart';

class AddListingLocation extends StatelessWidget {
  const AddListingLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      SizedBox(height: Get.height*0.05,),
    Row(children: [const CustomArrowBack(),SizedBox(width: Get.width*0.1,),
    Text("Add Listing",style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,
    fontWeight: FontWeight.w800,fontSize: 20),)],),
    SizedBox(height: Get.height*0.09,),
    Row(
      children: [
        SizedBox(width:Get.width*0.05),
        Text("Where is the",style: TextStyle(color: kDarkBlueColor,fontSize: 20,
        fontWeight: FontWeight.w600,fontFamily: kRegularFont),),
        Text(" location ",style: TextStyle(color: kDarkBlueColor,fontSize: 20,
            fontWeight: FontWeight.w900,fontFamily: kRegularFont),),
        Text("?",style: TextStyle(color: kDarkBlueColor,fontSize: 20,
            fontWeight: FontWeight.w600,fontFamily: kRegularFont),)
      ],
    ),
    SizedBox(height:Get.height*0.05
    ),
    Container(width: Get.width*0.9,height: Get.height*0.44,
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent,width: 1),borderRadius: BorderRadius.circular(20),image: const DecorationImage(image:
      AssetImage("lib/assets/images/SmallMap.png",),
          fit: BoxFit.fill)),child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [
         InkWell(onTap:(){Get.to(()=>const LocationMap());},
           child: Container(height: 60,width: Get.width*0.9,
             decoration: BoxDecoration(color: kLightGreyColor,border: Border.all(width: 1,color: kLightGreyColor),
             borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20) )),child: Center(child: Text("Select on the map",
           style: TextStyle(color: Colors.black,fontSize: 12,fontFamily: kRegularFont,fontWeight: FontWeight.w500,
           ),),),),
         )
      ],),)],),);
  }
}
