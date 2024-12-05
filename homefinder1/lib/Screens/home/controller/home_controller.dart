// ignore_for_file: avoid_print, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/single%20detail/single_detail.dart';
import 'package:homefinder1/models/get_nearest_residences_model.dart'as n;

import 'package:homefinder1/utilities/colors.dart';

import '../../../models/get_all_reesidences_model.dart'as a;

import '../../../models/get_all_reviews_of_residence_model.dart' as c;

import '../../../models/get_one_residence_model.dart'as o;
import '../../../models/get_residence_images_model.dart'as a;
import '../../../models/respose_model.dart';
import '../../../services/residences_services.dart';
import 'package:flutter/material.dart';


class HomeController extends GetxController {
  final BuildContext? context;

int? SelectedResidenceIndex;
  HomeController( this.context);
  ScrollController scroll = ScrollController();
  bool isLoading = true;
  int counterOfResidences =6;
  int maxNoOfPagesOfResidences = 1;
  bool isLoadingMoreDataOfResidences = false;
  List<a.Residence>? residences;
  o.Residence? residence;
  int? ResidenceCount;
  late TextEditingController searchController;
int? SelectedResidenceIndex1;
int favSelectedIndex=0;
  int favSelectedIndex1=0;
List<bool>add=[];
int itemCount1=0;
  int itemCount2=0;
  @override
  void onInit() {
    super.onInit();
    update();

     getDataOfResidences(context!);
    getDataOfNearestResidences(context!);
update();

  }
List<a.Image>?images;

bool? isLiked;
  getPhotosOfResidence(String resId,BuildContext context) async {
    try {
      isLoading=true;
      a.GetResidencesImagesModel? response =
      await ResidenceServices.fetchImagesOfResidences(
          resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        images = response.images ?? [];
        print(images);

        // Print or access other properties as needed
        print("Number of residences: ${images?.length}");
      }

      isLoading = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
    }
    update();
  }
List<c.Review>?reviews;
  getReviewsOfResidence(String resId,BuildContext context) async {
    try {
      isLoading=true;
      c.GetAllReviewsOfResidenceModel? response =
      await ResidenceServices.fetchReviewsOfResidences(
          resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        reviews = response.reviews ?? [];

        // Print or access other properties as needed
        print("Number of residences: ${images?.length}");
      }

      isLoading = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
    }
  }
  int counterOfNearestResidences=4;
  List <a.Residence>?nearestResidences;
  int nearestResidencesCounter=0;
  getDataOfResidences(BuildContext context) async {

    if (counterOfResidences == 6) {
      try {
        a.GetAllResidencesModel? response = await ResidenceServices.fetchAllResidences(counterOfResidences, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          residences = response.residences ?? [];
          ResidenceCount = response.count ?? 0;
        if(residences==[]){


        }else{

        }
          // Print or access other properties as needed
          print("Number of residences: ${residences?.length}");

        }



      } catch (e) {
        print("Exception occurred: $e");

      }
    } else {

    }  isLoading = false;
    update();
  }
  getDataOfOneResidences(int Id,String resId,BuildContext context) async {
      try {
        o.GetOneResidencesModel? response = await ResidenceServices.fetchOneResidences( resId, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          residence = response.residence ;


         update();
        Get.to(()=>SingleDetailScreen(Id,resId));
          update();


          // Print or access other properties as needed
          print("Number of residences: $residence");
        }


      } catch (e) {
        print("Exception occurred: $e");

      }
      isLoading = false;
      update();
  }
  Future<void> addResidenceToFav(String resId,BuildContext context) async {
    try {
      ResponseModel? data = await ResidenceServices.addFavorite(
          resId,
          context
      );
      if (data?.status == "success") {

        print(data?.message);
        residence?.isLiked!=residence?.isLiked;

      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }

    getDataOfResidences(context);
    update();
  }
  Future<void> removeResidenceFromFav(String resId,BuildContext context) async {
    try {
      ResponseModel? data = await ResidenceServices.deleteFavorite(
          resId,
          context
      );
      if (data?.status == "success") {

        print(data?.message);
        residence?.isLiked!=residence?.isLiked;
        update();

      }else{

      }
    } catch (e) {

      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);

    }

    bool test4 = Get.isRegistered<HomeController>();
    if(test4){
      Get.delete<HomeController>();
    }
    update();
    getDataOfResidences(context);
    update();
  }
  getDataOfNearestResidences(BuildContext context) async {

    if (counterOfNearestResidences == 4) {
      try {
        a.GetAllResidencesModel? response = await ResidenceServices.fetchAllResidences(counterOfNearestResidences, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          nearestResidences = response.residences ?? [];
          nearestResidencesCounter = response.count ?? 0;
          // Print or access other properties as needed
          print("Number of residences: ${nearestResidences?.length}");

        }



      } catch (e) {
        print("Exception occurred: $e");

      }
    } else {

    }
    getDataOfResidences(context);
  }



}



