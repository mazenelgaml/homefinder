// ignore_for_file: prefer_is_empty, non_constant_identifier_names, use_build_context_synchronously

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/user_chat_model.dart';
import '../../../../models/user_search_chat_model.dart';
import '../../../../services/chat_services.dart';


class ChatListController extends GetxController{
 late UserChatModel? users ;
 late UserSearchChatModel? usersSearchData ;
  bool isLoading = true;
  bool hasNoData = false;
  bool searchIsActive = false;
  bool searchHasNoData = false;
 late TextEditingController searchController;

final BuildContext context;

  ChatListController(this.context);
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    getChatList();
  }
deleteConversation(BuildContext context,String userId){
  CoolAlert.show(
    context: context,
    type: CoolAlertType.warning,
    title: "Warning",
    text: "You Want To Delete This Conversation",
    showCancelBtn: true,cancelBtnText: "cancel",confirmBtnText:"delete",onCancelBtnTap: (){
      Get.back();
  },onConfirmBtnTap: (){
    deletingConversation(userId);
  }

  );
}
deletingConversation(String userId) async {
  try {
    var data = await ChatServices.deleteConversation(context, userId);

    if (data?.status == "success") {
      isLoading = true;
      update();
      getChatList();
    }
  } catch (e) {
    String errorMessage = " $e";
    String part = errorMessage.substring(26, 35);
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: "Error",
      text: part,
    );
  }

}
String returnDateAndTime(String? date){
   String dateOrTime = "" ;
   final format = DateFormat('HH:mm a');
   DateFormat formatDate = DateFormat("MMM dd");
   final dateTime = DateTime.parse(date??"");
   if(dateTime.day == DateTime.now().day){
     dateOrTime = format.format(dateTime);
   }else{
     dateOrTime = formatDate.format(dateTime);
   }
   return dateOrTime;
}

  getChatList() async {
    isLoading = true;
    update();
    users = await ChatServices.getUserChatModel(context);
    if(
    users?.chatUsers?.length==0||users?.chatUsers==[]
    ){
      hasNoData = true;

    }
    isLoading = false;
    update();
  }
}