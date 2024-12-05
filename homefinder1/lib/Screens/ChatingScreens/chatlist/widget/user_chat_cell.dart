
// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';


import '../../../../models/user_chat_model.dart' ;
import '../controller/chat_list_controller.dart';


class ChatUserCard extends StatelessWidget {
   const ChatUserCard({
    Key? key,
     required this.chat,
    required this.press, required this.longPress,
  }) : super(key: key);

   final ChatUser? chat;
  final VoidCallback press;
  final VoidCallback longPress;

  @override
  Widget build(BuildContext context) {
    ChatListController controller = ChatListController(context);
    return InkWell(
      onTap: press,
      onLongPress: longPress,
      child: Column(
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
                      chat?.image?.url!=""?chat?.image?.url??"":'https://via.placeholder.com/150',
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
                  Text(chat?.fullName??"",style:  TextStyle(
                      fontFamily: kRegularFont,
                      color: kDarkBlueColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                  ),
                  const SizedBox(height: 10,),
                  Text(chat?.lastMessage?.messageContent??"",style:  TextStyle(
                      height: 1,
                      fontFamily: kRegularFont,
                      color:kDarkBlueColor,
                      fontSize: 14),),
                ],
                      ),

                  ],
                ),
                Text(controller.returnDateAndTime(chat?.lastMessage?.createdAt??""),style:  TextStyle(
                    height: 1,
                    fontFamily: kRegularFont,
                    color: kDarkBlueColor,
                    fontSize: 14),),
              ],
            ),
          ),
           Divider(
            color: kPrimaryColor,
            height: 1,
            thickness: 2,

          ),
        ],
      ),
    );
  }
}