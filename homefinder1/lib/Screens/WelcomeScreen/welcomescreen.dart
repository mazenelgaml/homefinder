import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/SignIn/signin.dart';
import '../auth/Signup/signup.dart';

class Welcomescreen extends StatelessWidget{
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
            children: [
              const Image(image: AssetImage('lib/assets/images/Cream & Brown Minimal Home.png')),
              const Row(
                children: [
                  Text("  Discover" ,style: TextStyle(color: Color(0xff6C63FF),fontSize: 32,fontWeight: FontWeight.bold),),
                  Text(" and Find Your " ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold , fontSize: 32),),
               ]
              ),
             const Row(
               children: [
                 Text("   Perfect " ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold , fontSize: 32),),
                 Text("Dream House" , style: TextStyle(color: Color(0xff6C63FF),fontSize: 32,fontWeight: FontWeight.bold),),
          
               ],
             ),
          
             const Text("Explore and locate your ideal dream home" ,style: TextStyle(color: Color(0xffA09695) ,fontSize: 15),),
              const SizedBox(height: 20,),
              SizedBox(
                height: 65,
                width: 350,
                child: ElevatedButton(onPressed: (){
                 Get.to((()=>  const SignUp()),
                  );
                },
                  style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
              ) ,
                  ),
                    child: const Text("Sign up" , style: TextStyle(color: Colors.white , fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              ),
              const SizedBox(height: 20,),
          
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(onPressed: (){
               Get.to(() =>  const SignIn(),
                  );
                },
                  style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                  ),
                  child: const Text("Sign in" , style: TextStyle(color: Colors.white , fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
          
              ]),
          ),
        ),
      ));
  }


}