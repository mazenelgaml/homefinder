// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Box extends StatelessWidget{

  Box( {super.key, Key?Key , this.favCol,this.onPressed,this.onTap,this.gridView , required this.index, this.image,  this.title,  this.price,  this.location});
 String? image;
 String? title;
 String? price;
 String? location;
 void Function()? onTap;
  var gridView;
  int index;
  void Function()? onPressed;
  Color? favCol;
  @override
  Widget build(BuildContext context){

    return  InkWell(
      onTap: onTap??(){},
      child: Container(
        height:Get.height*0.91,
        width: Get.width*0.4,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade200,blurRadius: 15)],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white70,
        ),
        child: Column(
          children: [
            ClipRRect(
              child:  Image(image: NetworkImage(image??"" ) ,fit: BoxFit.cover,
                height: 141,
                width: double.infinity,
              ),

              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16) , topRight: Radius.circular(16)),
            ),

              Center(
                child: ClipRRect(
                  child: Container(
                    height:106,
                    width: 180,
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0,left: 3),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title??"", style: const TextStyle(fontWeight: FontWeight.w500 ,fontSize: 20),),

                            Text(price??"" , style: const TextStyle( fontSize: 12,color: Color(0xff6C63FF)),),

                            SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on , color: Color(0xffB9B9B9)),
                                      SizedBox(width:Get.width*0.245,child: Text(location ??"",overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w300 ,fontSize: 12, color: Color(0xffB9B9B9)),)),
                                    ],
                                  ),

                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: InkWell(
                                      onTap: (){},
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: IconButton(onPressed:onPressed ,icon: Icon(Icons.favorite_rounded , color: favCol,)),
                                      ),
                                    ),
                                  ) ,
                                ],
                              ),
                            ), ]
                      ),
                    ),
                  ),
                  borderRadius: const BorderRadius.only( topRight: Radius.circular(16) ,topLeft: Radius.circular(16) ,bottomRight: Radius.circular(16) ,bottomLeft: Radius.circular(16)),
                ),

              )  ,
          ] ,

        ),

      ),
    );
  }

  elementAt(int index) {
    for(int i = 0 ; i >= 0 ; i++){
      index++;


    }
  }
}