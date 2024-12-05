import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/conversation_model.dart';
import '../controller/chat_screen_controller.dart';
import 'chatting_cell.dart';
class MessagesList extends StatelessWidget {
   const MessagesList({Key? key, required this.listOfMessages, required this.receiverId}) : super(key: key);
   final List<Message>? listOfMessages ;
   final String receiverId;




  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      init: ChatScreenController(receiverId,context),
      builder: (controller) =>  Expanded(
        child: Container(
          padding:  const EdgeInsets.symmetric(horizontal: 10),
          decoration:    const BoxDecoration(
            color: Colors.white,

          ),
          child: ClipRRect(
            borderRadius:  const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child:Padding(
              padding:  const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listOfMessages?.length,
                  itemBuilder: (context, int index) {
                    return  Column(
                      children: [
                        ChattingCell(messageText: listOfMessages?[index].messageContent??"", sender:controller.detectWhoWroteTheMessage(listOfMessages?[index].senderId??0),messageTime: listOfMessages?[index].createdAt==listOfMessages?[index].updatedAt?controller.returnDateAndTime(listOfMessages?[index].createdAt):"Updated on ${controller.returnDateAndTime(listOfMessages?[index].updatedAt)}", longPress: () {controller.takeActionWithTheMessage(listOfMessages?[index].messageContent??"",listOfMessages?[index].id??"");  },),


                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
