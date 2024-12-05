// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';


import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:homefinder1/models/response_model.dart';
import 'package:homefinder1/services/chat_services.dart';
import 'package:intl/intl.dart';

import '../../../../models/conversation_model.dart';
import '../../../../models/send_message_response_model.dart';
import '../../../../utilities/memory.dart';


class ChatScreenController extends GetxController{
 late ConversationModel? chatList;
bool isLoading = true;
final String receiverId;
bool isEditingTheMessage = false;
String messageId = "";
final TextEditingController msgController =  TextEditingController();
Timer? timer;
bool appBarDataIsLoading = true;
late String? employeeData ;
final BuildContext context;
  ChatScreenController(this.receiverId, this.context);
@override
  void onInit() {
  getData();
  getAppBarData();
    // TODO: implement onInit
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => getData());
  }
@override
  onClose() {
  timer?.cancel();
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
 takeActionWithTheMessage(String messageDetails,String messageId){
   CoolAlert.show(
       context: context,
       type: CoolAlertType.info,
       title: "",
       text: "Decide what to do with this message ``$messageDetails``",
       closeOnConfirmBtnTap: true,
       showCancelBtn: true,
       cancelBtnText: "edit the message",
       confirmBtnText:"delete the message",
       onCancelBtnTap: (){
     editingTheMessage(messageDetails, messageId);
   },onConfirmBtnTap: (){

         deleteTheMessage( messageDetails, messageId);

   });

 }
 editingTheMessage(String messageDetails,String messageId){
   isEditingTheMessage = true;
   this.messageId = messageId;
   update();
  msgController.text = messageDetails;
 }
 editTheMessage() async {
   print(receiverId);
   ResponseModel? status = await ChatServices.editMessage(context, messageId, msgController.text);
   if(status?.status == "success"){

     getData();
   }else{
     update();
     CoolAlert.show(
       context: context,
       type: CoolAlertType.error,
       title: "sorry an error has been occured",
       text:status?.message??"",
     );
   }
 }
 deletingTheMessage(String messageDetails,String messageId){
   this.messageId = messageId;
   update();
   CoolAlert.show(
       context: context,
       type: CoolAlertType.warning,
       title: "Warning",
       text: "You Want To Delete This Message ``$messageDetails``",
       showCancelBtn: true,cancelBtnText: "cancel",confirmBtnText:"delete",onCancelBtnTap: (){
     Get.back();
   },onConfirmBtnTap: (){
     deleteTheMessage( messageDetails, messageId);
   });
 }
 deleteTheMessage(String messageDetails,String messageId) async {
   print(receiverId);
   ResponseModel? status = await ChatServices.deleteMessage(context, messageId);
   if(status?.status == "success"){

     getData();
   }else{
     update();
     CoolAlert.show(
       context: context,
       type: CoolAlertType.error,
       title: "sorry an error has been occured",
       text:status?.message??"",
     );
   }
 }
getAppBarData() async {
  // employeeData = await EmployeesServices.getEmployeeProfile(receiverId);
  appBarDataIsLoading = false;
  update();
}
getData() async {
   chatList = await ChatServices.getUserConversation(context, receiverId);
   isLoading = false;
   update();
}

detectWhoWroteTheMessage( senderId){
  bool theUserIsSender = false;
  var employeeId =  Get.find<StorageService>().getId;
  if(
  senderId == employeeId
  ){
    theUserIsSender = true;
  }
  return theUserIsSender;
}


sendMessage() async {
  print(receiverId);
  SendMessageResponseModel? status = await ChatServices.sendMessage(context, receiverId, msgController.text);
  if(status?.status == "success"){

  getData();
  }else{
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: "sorry an error has been occured",
      text:status?.message?.messageContent??"",
    );
  }
}
}
