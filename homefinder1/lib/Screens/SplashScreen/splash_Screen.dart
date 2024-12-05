
// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import 'package:splash_view/source/presentation/presentation.dart';

import '../../utilities/memory.dart';
import '../WelcomeScreen/welcomescreen.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SplashView(

      backgroundColor: const Color(0xff6C63FF),
      duration: const Duration(seconds: 6),
      done: Done(
          Get.find<StorageService>().checkUserIsSignedIn?const HomeScreen():const Welcomescreen()),

      logo: const Stack(
        alignment: Alignment.topCenter,
          children:[
            Image(image: AssetImage('lib/assets/images/Minimalist Modern Real Estate Agent Logo (3) 1.png')),
         Padding(
           padding: EdgeInsets.all(50.0),
           child: 
             Image(image: AssetImage('lib/assets/images/HomeFinder.png'))
           // ArcText(radius: 110,
           //     text: "Home Finder",
           //      textStyle:TextStyle(fontWeight: FontWeight.bold , fontSize: 40 ,color: Colors.white) ,
           //   startAngle:180,
           //     startAngleAlignment: StartAngleAlignment.start,
           //     placement: Placement.middle,
           //     direction: Direction.clockwise
           // ),
         )
      ]
    ) );
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    // AnimatedSplashScreen(
    //   splash:  SingleChildScrollView(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Container(
    //             child: Text("Home Finder" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40 ,color: Colors.white),),
    //           ),
    //           SizedBox(
    //             width: 500,
    //               height: 100,
    //               child: Image(image: AssetImage('lib/assets/images/Minimalist Modern Real Estate Agent Logo (3) 1.png')))
    //         ],
    //       ),
    //     ),
    //   ),
    //   nextScreen: Welcomescreen(),
    //   duration: 6000,
    //   backgroundColor: Color(0xff6C63FF),
    //   splashTransition: SplashTransition.fadeTransition,
    //
    // );
  }

}