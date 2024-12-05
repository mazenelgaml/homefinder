import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add%20listing%20-%20photos/widget/grid_view.dart';


import '../../Widget/custom_arrow_back.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';

class AddListingPhotos extends StatefulWidget{
  const AddListingPhotos({super.key});

    @override
  State<AddListingPhotos> createState() => _AddListingPhotosState();
}

class _AddListingPhotosState extends State<AddListingPhotos> {
  final List gridview = [
    {
      "image" : "lib/assets/images/Shape1.png",
    },
    {
      "image" : "lib/assets/images/Shape2.png",
    },
    {
      "image" : "lib/assets/images/Shape3.png",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.width*0.13),
           Row(children: [const CustomArrowBack(),
             SizedBox(width: Get.width*0.1,),
               Text("Add Listing",style: TextStyle(fontFamily: kRegularFont,fontWeight: FontWeight.w900,fontSize: 23,color: kDarkBlueColor),),
          ],),
          SizedBox(height: Get.height*0.09,),
          Row(children: [
            SizedBox(width: Get.width*0.02,),
            Text("   Add",
            style: TextStyle(fontSize: 20,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),),
            Text(" photos ",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: kDarkBlueColor,fontFamily: kRegularFont),),
            Text("to your",
              style: TextStyle(fontSize: 20,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),),
          ],),
          Row(
            children: [
              Text("     listing" ,style: TextStyle(fontSize: 20,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),
        ),
            ],
          ),

          SizedBox(height: Get.height*0.05,),
          Center(
            child: Container(
              height: 450,
              color: const Color(0xffF7F7F7),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    crossAxisSpacing: 8 , mainAxisSpacing: 8 ,mainAxisExtent: 200
                ),
                  itemCount: gridview.length,
                  itemBuilder: (BuildContext context, int index) {
                  return GridView1(gridView: gridview, index: index);
                  },
                ),
              ),

            ),
          ),
          SizedBox(height: Get.height*0.09,),
          Center(
            child: Container(
              width: 210,
              height: 64,
              decoration: BoxDecoration(color: kPrimaryColor,border: Border.all(color: kPrimaryColor,width: 1),borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
                      fixedSize: const Size(200,70)), child:Text( "Next",style: TextStyle(color: Colors.white,fontFamily: kRegularFont,fontSize: 20,fontWeight: FontWeight.w700,),)),
            ),
          ),
        ])));
  }
}