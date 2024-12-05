// ignore_for_file: prefer_is_empty

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/user_search_chat_model.dart';
import '../../../../services/chat_services.dart';

class NewChatController extends GetxController{
  late UserSearchChatModel? usersSearchData ;
  bool isLoading = true;
  bool hasNoData = false;
  bool searchIsActive = false;
  bool searchHasNoData = false;
  late TextEditingController searchController;

  final BuildContext context;

  NewChatController(this.context);
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    getChatList();
  }


  activateSearch(){
    searchIsActive = true;
    isLoading =true;
    update();
  }
  closeSearch(){
    searchIsActive = false;
    update();
  }
  searchForUser() async {
    usersSearchData = await ChatServices.searchUserChatModel(context, searchController.text);
    if(
    usersSearchData?.users?.length==0||usersSearchData?.users==[]
    ){
      searchHasNoData = true;
    }else{
      searchHasNoData = false;
    }
    isLoading = false;
    update();
  }
  getChatList() async {
    isLoading = true;
    update();
    usersSearchData = await ChatServices.searchUserChatModel(context, "");
    if(
    usersSearchData?.users?.length==0||usersSearchData?.users==[]
    ){
      hasNoData = true;

    }
    isLoading = false;
    update();
  }
}