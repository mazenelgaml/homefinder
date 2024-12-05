// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Forgot%20Password/controller/forgot_password_controller.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';


class ForgotPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ForgotPasswordController(),
        builder:( ForgotPasswordController controller)
    {
      return Scaffold(
        appBar: AppBar(title: const Text('                      Welcome!',
            style: TextStyle(fontSize: 0, color: Colors.transparent)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Forgot Password?" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              ),
              const SizedBox(height: 30,),
              const Center(child: Image(image: AssetImage('lib/assets/images/Forgot password-amico 1.png'))),
              const SizedBox(height: 20,),
              const Text("Dont Worry." ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              const Text("Enter Your Email To Reset" ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              const Text("your password", style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              const SizedBox(height: 70,),

              CustomTextFieldWidget(Controller: controller.emailaddressController, validator: controller.emailValidator, keyboardType: TextInputType.emailAddress, textfieldHint: "Enter Your Email", textfieldIcon: const Image(image: AssetImage("lib/assets/images/MessageIcon.png"),), ispasswordField: false, obscureText: false, suffixIcon: const Icon(Icons.abc,color: Colors.transparent,),),

              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(onPressed: (){
                         controller.forgotPassword(context);

                }
                  ,
                  child: const Row(
                    children: [
                      Text("           Send" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),

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
      );
    }



    );}

}