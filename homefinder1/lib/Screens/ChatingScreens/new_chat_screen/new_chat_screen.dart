import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/ChatingScreens/new_chat_screen/widget/user_search_list_cell.dart';

import '../../../Widget/no_data_widget.dart';
import '../../../utilities/colors.dart';
import '../ChatScreen/chating_screen.dart';
import '../chatlist/widget/loading_chat_list_widget.dart';
import 'controller/new_chat_controller.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewChatController>(
        init: NewChatController(context),
        builder: (controller) =>  Scaffold(
            backgroundColor: Colors.white,
            appBar:  AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 1.0,
              title: const Text("new chat list",style: TextStyle(color: Colors.white),),
              leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                onPressed: (){
                  Get.back();
                },

              ),
              actions: [
                IconButton(icon: const Icon(Icons.search,color: Colors.white,),
                  onPressed: (){
                    controller.activateSearch();
                  },

                ),
              ],
            ),

            body:SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    controller.searchIsActive?Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                          child: Container(
                            width:Get.width*0.96,
                            constraints: BoxConstraints(
                              minHeight: Get.height * 0.07,

                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(1, 1), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.search,color: kPrimaryColor,),


                                    SizedBox(
                                      width: Get.width * 0.7,
                                      child: TextField (
                                        controller: controller.searchController,
                                        onEditingComplete: (){
                                          controller.searchForUser();
                                        },

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'search for users',
                                          labelStyle: TextStyle(
                                            shadows: <Shadow>[
                                              Shadow(
                                                  offset:
                                                  const Offset(0.5, 0.5),
                                                  blurRadius: 0.5,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ],
                                            fontSize: 13,
                                            letterSpacing: 0,

                                            color: kDarkBlueColor,
                                          ),

                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: (){
                                          controller.closeSearch();
                                        },
                                        child: Icon(Icons.close,color: kPrimaryColor,)),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ):Container(),
                    controller.searchIsActive?controller.searchHasNoData?NoDataWidget(refreshedFunc: (){
                      controller.getChatList();
                    },
                      text: "No Users Available With That Name", imgPath: 'lib/assets/images/Search-rafiki.png',   height: Get.height*0.78,
                      width: Get.width,hasRefreshButtonOrNot: true,
                    ):controller.isLoading?SizedBox(
                      height: Get.height*0.78,
                      width: Get.width,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.usersSearchData?.users?.length,
                          itemBuilder: (context, int index) {
                            return UserSearchListCell(press: () async {
                              Get.to(()=>ChattingScreen(reciverId:controller.usersSearchData?.users?[index].id??"", reciverName: controller.usersSearchData?.users?[index].fullName??"", reciverImage: controller.usersSearchData?.users?[index].imageUser?.url??"",));
                            },userData: controller.usersSearchData?.users?[index], );
                            //        chat: controller.employees?[index]
                          }),
                    ):
                    SizedBox(
                      height: Get.height*0.78,
                      width: Get.width,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.usersSearchData?.users?.length,
                          itemBuilder: (context, int index) {
                            return UserSearchListCell(press: () async {
                              Get.to(()=>ChattingScreen(reciverId:controller.usersSearchData?.users?[index].id??"", reciverName: controller.usersSearchData?.users?[index].fullName??"", reciverImage: controller.usersSearchData?.users?[index].imageUser?.url??"",));
                            },userData: controller.usersSearchData?.users?[index], );
                            //        chat: controller.employees?[index]
                          }),
                    ):controller.isLoading?SizedBox(

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
                          itemCount: controller.usersSearchData?.users?.length,
                          itemBuilder: (context, int index) {
                            return UserSearchListCell(press: () async {
                              Get.to(()=>ChattingScreen(reciverId:controller.usersSearchData?.users?[index].id??"", reciverName: controller.usersSearchData?.users?[index].fullName??"", reciverImage: controller.usersSearchData?.users?[index].imageUser?.url??"",));
                            },userData: controller.usersSearchData?.users?[index], );
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
