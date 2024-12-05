import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/custom_arrow_back.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(children: [

      SizedBox(height: Get.height*0.05,),
      Row(children: [const CustomArrowBack(),SizedBox(width: Get.width*0.08,),
        Text("Search Results",style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,
            fontWeight: FontWeight.w800,fontSize: 20),)],),
      SizedBox(height: Get.height*0.07,),
      Container(
        width: Get.width*0.9,
        decoration: BoxDecoration(border: Border.all(color: Colors.transparent,width: 1),
        borderRadius: BorderRadius.circular(10)),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF4F4F4),
            hintText: "Search House, Apartment , etc",
            prefixIcon: const Icon(Icons.search_outlined , color: Colors.black,),
            suffixIcon: InkWell(
                onTap: (){},
                child: const Image(image: AssetImage('lib/assets/images/options.png'))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffF4F4F4),
                  width: 3,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff6C63FF),
                  width: 3,
                )
            ),
          ),
        ),
      ),
      SizedBox(height: Get.height*0.06,),
      Row(children: [SizedBox(width: Get.width*0.085,),
        Text("Found ",style: TextStyle(
        color: kDarkBlueColor,fontWeight: FontWeight.w500,fontFamily: kRegularFont,fontSize: 18
      ),),
        Text("0 ",style: TextStyle(
            color: kDarkBlueColor,fontWeight: FontWeight.w800,fontFamily: kRegularFont,fontSize: 18
        ),),
        Text("estates ",style: TextStyle(
            color: kDarkBlueColor,fontWeight: FontWeight.w500,fontFamily: kRegularFont,fontSize: 18
        ),)],),
      SizedBox(height: Get.height*0.105,),
      const Center(child: Image(image:AssetImage("lib/assets/images/NotFound Illustration.png")),)
    , SizedBox(height: Get.height*0.04,),
      Center(child:
      Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Search",
        style: TextStyle(
        color: kDarkBlueColor,fontSize: 25,fontFamily: kRegularFont,fontWeight: FontWeight.w500
      ),),Text(" not found",style: TextStyle(
          color: kDarkBlueColor,fontSize: 25,fontFamily: kRegularFont,fontWeight: FontWeight.w800
      ))],),),
      SizedBox(height: Get.height*0.03,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: Get.width*0.07,),
          SizedBox(
            width: Get.width*0.7,
            child: Text("Sorry, we can’t find the real estates you are looking for. Maybe, a little spelling mistake?",style: TextStyle(
                color: const Color(0xff53587A),fontSize: 12,fontFamily: kRegularFont,fontWeight: FontWeight.w500
                     , )),
          ),
        ],
      )
    ],),),);
  }
}
