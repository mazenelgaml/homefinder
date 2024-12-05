import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomArrowBack extends StatelessWidget{
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 25,),
        Container(
          width: 50,
          height: 55,
          decoration: BoxDecoration(color: const Color(0xff9292FD).withOpacity(0.2),
              border: Border.all(color: const Color(0xff9292FD).withOpacity(0.2)),borderRadius: BorderRadius.circular(15)),
          child:
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_ios ,size: 20,color: Color(0xff6C63FF),) ,),
              ),

        ),
      ],
    );
  }

}