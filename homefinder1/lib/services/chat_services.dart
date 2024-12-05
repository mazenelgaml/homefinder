
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/conversation_model.dart';
import '../models/response_model.dart';
import '../models/send_message_response_model.dart';
import '../models/user_chat_model.dart';
import '../models/user_search_chat_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';

class ChatServices{
  static ApiService api = ApiService();
  static Future<UserChatModel?> getUserChatModel(BuildContext context) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token = Get
        .find<StorageService>()
        .getToken;
    var data = await api.request(context: context,Services.getUserChatListEndPoint, "GET",
        headers: {"Authorization": token});
    if (data != null) {
      return UserChatModel.fromJson(data);
    }
    return null;
  }
  static Future<ConversationModel?> getUserConversation(BuildContext context,String userId) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token =  Get
        .find<StorageService>()
        .getToken;
    var data = await api.request(context: context,"${Services.getUserConversationEndPoint}$userId", "GET",
        headers: {"Authorization": token});
    if (data != null) {
      return ConversationModel.fromJson(data);
    }
    return null;
  }
  static Future<UserSearchChatModel?> searchUserChatModel(BuildContext context,String searchKeyword) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token = Get
        .find<StorageService>()
        .getToken;

    var data = await api.request(context: context,"${Services.searchUserChatListEndPoint}search=$searchKeyword", "GET",
        headers: {"Authorization": token});
    if (data != null) {
      return UserSearchChatModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> deleteConversation(BuildContext context,String userId) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token = Get
        .find<StorageService>()
        .getToken;


    var data = await api.request(context: context,"${Services.deleteConversationEndPoint}$userId", "DELETE",
        headers: {"Authorization": token});
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> deleteMessage(BuildContext context,String messageId) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token = Get
        .find<StorageService>()
        .getToken;

    print(Services.searchUserChatListEndPoint);
    var data = await api.request(context: context,"${Services.deleteMessageEndPoint}$messageId", "DELETE",
        headers: {"Authorization": token});
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> editMessage(BuildContext context,String messageId,String messageText) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token = Get
        .find<StorageService>()
        .getToken;

    print(Services.searchUserChatListEndPoint);
    var data = await api.request(context: context,"${Services.editMessageEndPoint}$messageId", "PATCH",data: {
      "messageContent":messageText
    },
        headers: {"Authorization": token});
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<SendMessageResponseModel?> sendMessage(BuildContext context,String receiverId,String messageText) async {
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxZTI1ZWI4NTFmNzkyYzgzMTQyYTUiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxNjY3MiwiZXhwIjoxNzIxNDA4NjcyfQ.n1zNQkgrLH9bKPRLNDmd-f1wa-uPElNVyyv6-MZHSv0";

    var token = Get
        .find<StorageService>()
        .getToken;

    print("${Services.sendMessageEndPoint}$receiverId");
    print( "messageContent:$messageText");
    print("Authorization: $token");
    var data = await api.request(context: context,"${Services.sendMessageEndPoint}$receiverId", "POST",data: {
      "messageContent":messageText
    },
        headers: {"Authorization": token});
    if (data != null) {
      return SendMessageResponseModel.fromJson(data);
    }
    return null;
  }
}