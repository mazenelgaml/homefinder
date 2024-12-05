import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../utilities/colors.dart';

class LocationMap extends StatelessWidget {
  const LocationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(width: Get.width,height: Get.height,decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage("lib/assets/images/FullMap.png"),fit: BoxFit.fill)
    ),child: Column(children: [SizedBox(height: Get.height*0.07,),
      SizedBox(
        width: Get.width*0.9,
        height: Get.height*0.2,
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(

            filled: true,
            fillColor: const Color(0xffFFFFFF).withOpacity(0.8),
            hintText: "Enter your location",
            prefixIcon: const Icon(Icons.search_outlined , color: Colors.black,size: 20,),
            hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontFamily: kRegularFont,fontSize: 12),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Color(0xffF4F4F4),
                  width: 3,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Color(0xff6C63FF),
                  width: 3,
                )
            ),
          ),
        ),
      ),
    SizedBox(height: Get.height*0.62,),
      Center(
        child: Container(
          width: Get.width*0.85,
          height: 55,
          decoration: BoxDecoration(color: kPrimaryColor,border: Border.all(color: kPrimaryColor,width: 1),borderRadius: BorderRadius.circular(25)),
          child: ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
                  fixedSize: const Size(200,70)), child:Text( "Confirm",style: TextStyle(color: Colors.white,fontFamily: kRegularFont,fontSize: 20,fontWeight: FontWeight.w700,),)),
        ),
      )],),),);
  }
}
