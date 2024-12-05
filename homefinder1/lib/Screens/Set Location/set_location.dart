import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Sign%20up%20Sucess%20Notification/sign_up_sucess_notification.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';

class SetLocation extends StatelessWidget{
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('                      Welcome!',
        style: TextStyle(fontSize: 0, color: Colors.transparent)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    body: SingleChildScrollView(
        child: Column(
          children: [
           const CustomArrowBack(),
            const Text("Set Your Location" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),


            const SizedBox(height: 15,),
            const Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
            const Row(children:[
              Text("      for seccurity" , style: TextStyle(fontSize: 15),),
            ] ),
            const SizedBox(height: 70,),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffDEE4E7),
              ),
              height: 200,
              width: 300,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_on ,color: Color(0xff6C63FF),),
                        Text("  Your Location"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80,),
                  SizedBox(
                    height: 70,
                    width: 280,
                    child: ElevatedButton(onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  SignIn()),
                      //);
                    },
                      style: ElevatedButton.styleFrom(backgroundColor:const Color(0xffF6F6F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ) ,
                      ),
                      child: const Text("Set Location" , style: TextStyle(color: Colors.black , fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),


                ],
              ),
            ),
            const SizedBox(height: 200,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                Get.to(()=>  const SignUpSucessNotification());
              }
                ,
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
          ],
        ),
    ),
    )
    ;
  }

}