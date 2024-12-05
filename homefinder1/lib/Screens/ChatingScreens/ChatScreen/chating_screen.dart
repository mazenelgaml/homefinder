import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/ChatingScreens/ChatScreen/widget/loading_message_list_widget.dart';
import 'package:homefinder1/Screens/ChatingScreens/ChatScreen/widget/messages_list.dart';
import 'package:homefinder1/Screens/ChatingScreens/ChatScreen/widget/text_field_chat_bar.dart';
import 'package:homefinder1/utilities/colors.dart';

import '../../../utilities/constants.dart';
import 'controller/chat_screen_controller.dart';


class ChattingScreen extends StatelessWidget {
 final String reciverId;
 final String reciverName;
 final String reciverImage;
  const ChattingScreen({Key? key, required this.reciverId, required this.reciverName, required this.reciverImage}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      init: ChatScreenController(reciverId,context),
      builder: (controller) => Scaffold(
        appBar:PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppBar(

            iconTheme:   IconThemeData(color:kVeryVioletColor),
            backgroundColor:  Colors.white,
            flexibleSpace:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0,0,50.0,10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap:(){

                        },
                        child:controller.appBarDataIsLoading?Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                            .slide(): SizedBox(

                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              reciverImage!=""?reciverImage:'https://via.placeholder.com/150',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      controller.appBarDataIsLoading?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xFFDFDDDF),
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(10))
                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                          const SizedBox(height: 10,),
                          Container(
                            width: 200,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xFFDFDDDF),
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(10))
                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ],
                      ):Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(reciverName,style:  TextStyle(
                              fontFamily: kRegularFont,
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                          ),


                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
            centerTitle: false,

            leading: IconButton(
              icon:  Icon(
                Icons.arrow_back_ios,
                color: kVeryVioletColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [

              //massage list used to display massages
              controller.isLoading?LoadingMessageListWidget():MessagesList( listOfMessages:  controller.chatList?.chat?.messages,receiverId: reciverId,),
              //Main widget at the end of screen
             Padding(
               padding: const EdgeInsets.only(bottom: 50),
               child: TextFieldChatBar(sendMassage: (value){
                 if(controller.isEditingTheMessage){
                   controller.editTheMessage();
                 }else {
                   controller.sendMessage();
                 }
                }, myController:  controller.msgController,),
             )


            ],
          ),
        ),
      ),
    );
  }


   }


