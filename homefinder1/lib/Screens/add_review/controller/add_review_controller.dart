import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/get_user_model.dart';

import '../../../models/add_review_to_residence_model.dart';
import '../../../models/get_all_reviews_of_residence_model.dart'as a;
import '../../../models/like_review_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/residences_services.dart';

class AddReviewController extends GetxController{
  void onInit(){
    super.onInit();
    getdata();
  }
  String resId;
  TextEditingController commentController=TextEditingController();
  int rating=0;
  List<a.Review>? reviews;
  BuildContext context;
  bool isLoading=true;
  User? data;
  AddReviewController(this.context,this.resId);


  Future<void> addReview(BuildContext context) async {
    try {
      AddReviewToResidenceModel? data = await AuthServices.addReview(rating,
          commentController.text, resId, context);
      if (data?.status == "success") {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "success",
          text: "Review added sucessfully",
        );
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

  getdata() async
  {

    update();
    GetUserModel? response = await AuthServices.fetchUserData();

    if (response == null) {
      print("some error occured");
    } else {
      data= response.user;

    }

    isLoading = false;


    update();


  }
}