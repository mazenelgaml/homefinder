import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/controller/complete_sign_up_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';


class CompleteSignUp extends StatefulWidget{
  const CompleteSignUp({super.key});

  

  @override
  State<CompleteSignUp> createState() => _CompleteSignUpState();
}

class _CompleteSignUpState extends State<CompleteSignUp> {
  @override

  Widget build(BuildContext context) {
    return GetBuilder(
      init: CompleteSignUpController(),
        builder:( CompleteSignUpController controller){
          return Scaffold(

              appBar: AppBar(
                leading: const CustomArrowBack(),
                leadingWidth: Get.width*0.3,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                  child: Center(
                      child: Form(
                        key: controller.formkey,
                        child: Column(
                            children: [


                              const Text("Fill in bio to get" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),),
                              const Row(
                                children: [
                                  Text("     started" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),),
                                ],
                              ),
                              const SizedBox(height: 15,),
                              const Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
                              const Row(children:[
                                Text("      for seccurity" , style: TextStyle(fontSize: 15),)
                              ] ),


                            CustomTextFieldWidget(Controller: controller.fisrtnameController, validator: controller.fisrtnameValidator, keyboardType: TextInputType.text,textfieldHint: "First Name", textfieldIcon:const Icon(Icons.abc,color: Colors.transparent,), ispasswordField:false, obscureText: false, suffixIcon: const Icon(Icons.abc,color: Colors.transparent,),),
                           // SizedBox(height: 2,),

                            CustomTextFieldWidget(Controller: controller.lastnameController, validator: controller.lastnameValidator, keyboardType: TextInputType.text,textfieldHint: "Last Name", textfieldIcon: const Icon(Icons.abc,color: Colors.transparent,), ispasswordField:false, obscureText: false, suffixIcon: const Icon(Icons.abc,color: Colors.transparent,),),
                              CustomTextFieldWidget(Controller: controller.genderController, validator: controller.genderValidator, keyboardType: TextInputType.text, textfieldHint: "Gender", textfieldIcon: const Icon(Icons.abc,color: Colors.transparent,), ispasswordField: false, obscureText: false, suffixIcon: const Icon(Icons.abc,color: Colors.transparent,),),
                              CustomTextFieldWidget(Controller: controller.phoneController, validator: controller.phoneValidator, keyboardType: TextInputType.phone, textfieldHint: "Phone Number", textfieldIcon:const Icon(Icons.abc,color: Colors.transparent,), ispasswordField: false, obscureText: false, suffixIcon: const Icon(Icons.abc,color: Colors.transparent,),),


                              SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(onPressed: (){
                                  if (controller.formkey.currentState!.validate()) {

                                   controller.CompleteSignUp(context);


                                  }
                                },
                                  style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ) ,
                                  ),
                                  child: const Row(
                                    children: [
                                      Text("          Next" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),
                                      SizedBox(width: 10,),
                                      Icon(Icons.navigate_next , size: 30,),
                                    ],
                                  ),
                                ),
                              ),

                            ]
                        ),
                      )

                  )
              ));
          
    }
          
    );


}}