// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/featured_estates.dart';

class SuccessNotification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('                      Welcome!',
         style: TextStyle(fontSize: 0, color: Colors.transparent)),
       backgroundColor: Colors.transparent,
       elevation: 0,
     ),
     body: SingleChildScrollView(
       child: Center(
         child: Column(
           children: [
           const SizedBox(height: 20,),
             const Image(image: AssetImage('lib/assets/images/Checking boxes-rafiki 1.png')),
             const SizedBox(height: 15,),
             const Row(
               children: [
                 Text("         Check your mail" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30) ),
                 Image(image: AssetImage('lib/assets/images/Check.png')),
               ],
             ),
             const SizedBox(height: 40,),
             SizedBox(
               height: 50,
               width: 130,
               child: ElevatedButton(onPressed: (){
                 //Navigate to success notification screen
                // ignore: prefer_const_constructors
                Get.to(() =>  FeaturedEstates());
               }
                 ,
                 child: const Row(
                   children: [
                     Text("       ok" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),

                   ],
                 ),
                 style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(28),
                   ) ,
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }

}