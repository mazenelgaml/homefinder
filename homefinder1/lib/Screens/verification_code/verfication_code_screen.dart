import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../utilities/memory.dart';
import 'controller/verification_code_controller.dart';

class VerficationCode extends StatefulWidget {
  const VerficationCode({super.key});

  @override
  State<VerficationCode> createState() => _VerficationCodeState();
}

class _VerficationCodeState extends State<VerficationCode> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerficationCodeController>(
      init: VerficationCodeController(  Get.find<StorageService>().getId),
      builder: (VerficationCodeController controller) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: Get.width*0.2,
            leading:  const CustomArrowBack(),
            toolbarHeight: Get.height*0.12,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: Get.height*0.17,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Enter 6-digit",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Verification Code",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),

                    const Text("Code sent to your email. Code will expire in:"),
                    TimerBuilder.periodic(
                      const Duration(seconds: 1),
                      builder: (context) {
                        // Calculate remaining time
                        Duration remainingTime = controller.calculateRemainingTime();
                        // Format remaining time as HH:MM:SS
                        String formattedTime = controller.formatTime(remainingTime);
                        // Return the formatted time widget
                        return Text(
                          formattedTime,
                          style: const TextStyle(fontSize: 20),
                        );
                      },
                    ),
                  ],
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0,right: 10,left: 10),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: controller.verificationCodeController,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              fillColor: const Color(0xffF4F4F4),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color(0xffF4F4F4),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const Text("Didn't receive a code?", style: TextStyle(fontSize: 20),),
                            TextButton(
                              onPressed: () async {
                                controller.resendVerificationCode(context);
                              },
                              child: Text(
                                "Resend",
                                style: TextStyle(color:controller.remainingTimeInSeconds==0?const Color(0xff6C63FF):Colors.grey, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {

                  if (controller.formkey.currentState!
                      .validate()) {
                    controller.sendVerificationCode(context,int.parse(controller.verificationCodeController.text));
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize:const Size(190, 65),
                  backgroundColor: const Color(0xff6C63FF),
          
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.navigate_next, size: 30,),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
