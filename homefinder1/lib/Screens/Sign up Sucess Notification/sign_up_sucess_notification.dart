import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Forgot%20Password/forgot_password.dart';

class SignUpSucessNotification extends StatelessWidget{
  const SignUpSucessNotification({super.key});

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
              const SizedBox(height: 80,),
               const Image(image: AssetImage('lib/assets/images/Congrats.png')),
              const SizedBox(height: 30,),
              const Text("Congrats!" , style: TextStyle(color: Color(0xff9292FD), fontSize: 40),),
              const SizedBox(height: 15,),
              const Text("Your Profile Is Ready To Use" , style: TextStyle(color: Colors.black , fontSize: 28 , fontWeight: FontWeight.bold)  ,),
              const SizedBox(height: 200,),
              SizedBox(
                height: 50,
                width: 170,
                child: ElevatedButton(onPressed: (){
                Get.to(() =>  ForgotPassword());
                }
                  ,
                  style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ) ,
                  ),
                  child: const Row(
                    children: [
                      Text("       Start" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),

                    ],
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