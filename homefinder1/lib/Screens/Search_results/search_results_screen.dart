import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/custom_arrow_back.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';

class SaerchResults extends StatelessWidget {
  const SaerchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: Get.height*0.05,),
          Row(children: [const CustomArrowBack(),SizedBox(width: Get.width*0.08,),
            Text("Search Results",style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,
                fontWeight: FontWeight.w800,fontSize: 20),)],),
          SizedBox(height: Get.height*0.04,),
          SizedBox(
            width: Get.width*0.92,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF4F4F4),
                hintText: "Villa & Apartment",
                prefixIcon: const Icon(Icons.search_outlined , color: Colors.black,),
                suffixIcon: InkWell(
                    onTap: (){},
                    child: const Image(image: AssetImage('lib/assets/images/options.png'))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xffF4F4F4),
                      width: 3,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xff6C63FF),
                      width: 3,
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height*0.03,),
          Row(children: [SizedBox(width: Get.width*0.05),Text("542 Results Found",style: TextStyle(
            color: kDarkBlueColor,fontWeight: FontWeight.w600,fontFamily: kRegularFont,fontSize: 16
          ),)],),

          SizedBox(width: Get.width,height: Get.height*0.75,
            child: ListView.builder(itemCount: 5,physics: const BouncingScrollPhysics(),scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(width:Get.width*0.95,height: Get.height*0.15,
                        decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)
                            ,border: Border.all(color: Colors.white),boxShadow: const [BoxShadow(color: Colors.grey,
                                offset: Offset(0, 0),
                                blurRadius: 10)]) ,child: Row(mainAxisAlignment: MainAxisAlignment.start
                          ,children: [const SizedBox(width: 3,),const SizedBox(width: 105,height: 115,child: Image(image: AssetImage("lib/assets/images/Villa.png"),fit: BoxFit.fill,)),
                            Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                              children: [const SizedBox(height: 3,),Row(children: [const SizedBox(width: 5,),const Icon(Icons.star,color:Color(0xffEEA651),),const SizedBox(width: 2,),Text("5",
                                style: TextStyle(color:kGreyColor,fontFamily: kRegularFont,fontWeight: FontWeight.w600),),const SizedBox(width: 148,),
                                Container(height: 30,width: 90,decoration: BoxDecoration(color: const Color(0xffF4F6F9),border:
                                Border.all(color: const Color(0xffF4F6F9),),borderRadius:
                                BorderRadius.circular(25)),child: Center(
                                  child: Text("Apartment",
                                    style: TextStyle(color: kPrimaryColor,fontSize: 12,fontWeight: FontWeight.w600,fontFamily: kRegularFont),),
                                ),)],),Row(
                                children: [
                                  const SizedBox(width: 5,),
                                  Text("Woodland Apartment"
                                    ,style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w700
                                        ,fontSize: 16),),
                                ],
                              ),Row(children: [const SizedBox(width: 5,),const Icon(Icons.location_on,color: Color(0xff415770),size: 17,),Text("1012 Ocean avanue, New yourk, USA",
                                style: TextStyle(color: const Color(0xff415770),fontSize: 12,fontFamily:kRegularFont,fontWeight: FontWeight.w500),)],),
                                Row(children: [const SizedBox(width: 5,),Text("\$340/month"
                                  ,style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w700,fontSize: 13,fontFamily: kRegularFont),),
                                  const SizedBox(width: 135,),IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded,
                                    color: kGreyColor,size: 25,))],)],)],),),
                      const SizedBox(height: 10,)
                    ],
                  );}),)
        ],),
      ),
    );
  }
}
