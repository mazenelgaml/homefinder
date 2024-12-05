import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/user_search_chat_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utilities/colors.dart';
import '../../../../utilities/constants.dart';

class UserSearchListCell extends StatelessWidget {
  const UserSearchListCell({Key? key,  this.userData, required this.press}) : super(key: key);
  final User? userData;
  final VoidCallback press;
  Future<void> makePhoneCall(String phoneNumber,context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap:(){

                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
                      height: 64,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          userData?.imageUser?.url!=""?userData?.imageUser?.url??"":'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   [
                      const SizedBox(height: 10,),
                      Text(userData?.fullName??"",style:  TextStyle(
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                      ),
                      const SizedBox(height: 10,),
                      Text(userData?.phone??"",style:  TextStyle(
                          height: 1,
                          fontFamily: kRegularFont,
                          color:kDarkBlueColor,
                          fontSize: 14),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: Get.width*0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: press,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1.0,color: kPrimaryColor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("chat",style:  TextStyle(
                                          height: 1,
                                          fontFamily: kRegularFont,
                                          color:kDarkBlueColor,
                                          fontSize: 14),),
                                      const SizedBox(width: 10,),
                                      Icon(Icons.chat,color: kPrimaryColor,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                makePhoneCall(userData?.phone??"",context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1.0,color: kPrimaryColor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Phone Call",style:  TextStyle(
                                          height: 1,
                                          fontFamily: kRegularFont,
                                          color:kDarkBlueColor,
                                          fontSize: 14),),
                                      const SizedBox(width: 10,),
                                      Icon(Icons.call,color: kPrimaryColor,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),

            ],
          ),
        ),
        Divider(
          color: kPrimaryColor,
          height: 1,
          thickness: 2,

        ),
      ],
    );
  }
}
