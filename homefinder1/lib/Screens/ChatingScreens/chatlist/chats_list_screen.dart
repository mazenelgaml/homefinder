// ignore_for_file: prefer_is_empty, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/ChatingScreens/chatlist/widget/loading_chat_list_widget.dart';
import 'package:homefinder1/Screens/ChatingScreens/chatlist/widget/user_chat_cell.dart';
import 'package:homefinder1/utilities/colors.dart';
import '../../../Widget/no_data_widget.dart';
import '../ChatScreen/chating_screen.dart';
import '../new_chat_screen/new_chat_screen.dart';
import 'controller/chat_list_controller.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> with SingleTickerProviderStateMixin{

  @override
  void initState(){




    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListController>(
      init: ChatListController(context),
      builder: (controller) =>  Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 1.0,
            title: const Text("chat list",style: TextStyle(color: Colors.white),),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: (){
                Get.back();
              },

            ),

        ),
        floatingActionButton: InkWell(
          onTap: (){
            Get.to(()=>const NewChatScreen());
          },
          child: Container(
            width: Get.width*0.17,
            height: Get.height*0.08,
            decoration: BoxDecoration(
              border: Border.all( color:Colors.white,width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 13.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kPrimaryColor,Colors.white],
              ),shape: BoxShape.circle,
            ),
            child:  const Center(
              child: Icon(
                Icons.chat,
                weight: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body:SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                controller.isLoading?SizedBox(

                        height: Get.height*0.78,
                        width: Get.width,
                    child: const  LoadingChatListWidget()): controller.hasNoData?
                NoDataWidget(refreshedFunc: (){
                  controller.getChatList();
                },  height: Get.height*0.78,
                  width: Get.width,
                  text: "no chat available", imgPath: 'lib/assets/images/Search-rafiki.png', hasRefreshButtonOrNot: true,
                )
                    :SizedBox(
                  height: Get.height*0.78,
                  width: Get.width,
                      child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.users?.chatUsers?.length,
                      itemBuilder: (context, int index) {
                        return ChatUserCard(press: () async {
                          Get.to(()=>ChattingScreen(reciverId: controller.users?.chatUsers?[index].id??"", reciverName: controller.users?.chatUsers?[index].fullName??"", reciverImage: controller.users?.chatUsers?[index].image?.url??"",));
                          }, chat: controller.users?.chatUsers?[index], longPress: () { controller.deleteConversation(context,controller.users?.chatUsers?[index].id??""); }, );
                        //        chat: controller.employees?[index]
                      }),
                    ),
              ],
            ),
          ),
        )

    ));
  }
}
