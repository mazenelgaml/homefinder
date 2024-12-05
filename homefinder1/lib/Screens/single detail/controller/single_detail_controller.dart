
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/ChatingScreens/new_chat_screen/new_chat_screen.dart';
import 'package:homefinder1/Screens/add_review/add_review_screen.dart';
import 'package:homefinder1/Screens/prediction_price_for_detail/prediction_price_for_detail.dart';
import 'package:homefinder1/Screens/single%20detail/single_detail.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/models/add_review_to_residence_model.dart';
import 'package:homefinder1/models/get_all_reviews_of_residence_model.dart'as a;

import 'package:homefinder1/models/get_residence_images_model.dart'as i;
import 'package:homefinder1/models/like_review_model.dart';
import 'package:homefinder1/models/respose_model.dart';
import '../../../models/get_one_residence_model.dart' as o;
import '../../../models/get_one_review_model.dart'as or;
import '../../../models/recomendation_model.dart'as r;
import '../../../models/response_model.dart'as d;

import '../../../services/auth_service.dart';
import '../../../services/residences_services.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';

class SingleDetailController extends GetxController {

int? selectedDisLike;
or.Review?review;
Color love=Colors.grey;
  int rating = 0;
  List<a.Review>? reviews;
  String userId;
  int Id;
  BuildContext? context;

int? favSelectedIndex;

  SingleDetailController(this.Id,this.userId, this.context);

  o.Residence? residence;
  bool isLoading = true;
  ScrollController scroll = ScrollController();
  List<String> type = ["Description", "Gallery", "Review"];
  List<String> pOrLOrS = ["Description", "Gallery", "Review"];
  int selectedIndex = 0;
  late List<Widget> listViewItem = [];
  String descriptionOrGalleryOrReview = "Description";
  TextEditingController commentController = TextEditingController();

  final List<String> homeDetailsTitles = [
    "sqrt",
    "Bedrooms",
    "Bathrooms",
    "Safety Rank"
  ];
  final List<String> homeDeatilsNo = ["1.225", "1.225", "1.0", "4,457"];
  final List<String> homeDeatilsIcons = [
    "lib/assets/images/svgviewer-output (7).png",
    "lib/assets/images/bed1.png",
    "lib/assets/images/bathtub.png",
    "lib/assets/images/safety.png"
  ];
  final List<String> homeFacilitiesIcons = [
    "lib/assets/images/bxs_car-wash.png",
    "lib/assets/images/base.png",
    "lib/assets/images/map_swimming.png",
    "lib/assets/images/ion_restaurant.png",

  ];
  final List<String> homeFacilitiesTitles = [

    "Garage",
    "Basement",

    "Swimming pool",
    "Kitchen",

  ];
  final List<String> homeDetailImages = [
    "lib/assets/images/homeDetails1.png",
    "lib/assets/images/homeDeatail2.png",
    "lib/assets/images/homeDeatail3.png",
    "lib/assets/images/homeDeatail4.png",
    "lib/assets/images/homeDeatail5.png",
    "lib/assets/images/homeDeatail6.png",
  ];

  List<i.Image>? images;

  int? selectedIndexOfReview;
  List<r.Datum>? data;

  @override
  void onInit() {
    super.onInit();


     getDataOfOneResidences(userId, context!);
     getPhotosOfResidence(userId,context!);
     getReviewsOfResidence(userId, context!);


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

  update();
}

  getDataOfOneResidences(String resId, BuildContext context) async {
    try {
      o.GetOneResidencesModel? response =
          await ResidenceServices.fetchOneResidences(resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        residence = response.residence;

        // Print or access other properties as needed
        print("Number of residences: ${residence}");
         getDataOfRecommendationResidences(Id, context!);


      }


      update();
    } catch (e) {
      print("Exception occurred: $e");

    }
  }

  getPhotosOfResidence(String resId,BuildContext context) async {
    try {
      i.GetResidencesImagesModel? response =
          await ResidenceServices.fetchImagesOfResidences(
              resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        images = response.images ?? [];
        print(images);
update();
        // Print or access other properties as needed
        print("Number of residences: ${images?.length}");

      }


      update();
    } catch (e) {
      print("Exception occurred: $e");

    }
  }

  getReviewsOfResidence(String resId,BuildContext context) async {
    try {

      a.GetAllReviewsOfResidenceModel? response =
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


      update();
    } catch (e) {
      print("Exception occurred: $e");

    }
  }

  Future<void> addReview(BuildContext context) async {
    try {
      AddReviewToResidenceModel? data = await AuthServices.addReview(rating,
          commentController.text, residence?.residenceId ?? "", context);
      if (data?.status == "success") {}
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

  Future<void> addLikeToReview(String revId,String resId,BuildContext context) async {
    try {
      LikeReviewModel? data = await ResidenceServices.addLikeToReview(
          revId, context);
      if (data?.status == "success") {

        update();
        bool test4 = Get.isRegistered<SingleDetailController>();
        if(test4){
          Get.delete<SingleDetailController>();
        }
        getReviewsOfResidence(resId, context);
        update();
      }else{
        removeLikeToReview(revId,context);

        bool test4 = Get.isRegistered<SingleDetailController>();
        if(test4){
          Get.delete<SingleDetailController>();
        }
        update();
        getReviewsOfResidence(resId, context);
        update();
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }
  }

  Future<void> removeLikeToReview(String revId,BuildContext context) async {
    try {
      LikeReviewModel? data = await ResidenceServices.removeLikeToReview(
          revId, context);
      if (data?.status == "success") {
        print(data?.message);
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }
  }

  Future<void> addUnLikeToReview(String revId,String resId,BuildContext context) async {
    try {
      LikeReviewModel? data = await ResidenceServices.addUnLikeToReview(
          revId, context);
      if (data?.status == "success") {
        getReviewsOfResidence(resId, context);
        update();
      }else{
        removeUnLikeToReview(revId,  context);
        getReviewsOfResidence(resId, context);
        update();
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }
  }

  Future<void> removeUnLikeToReview(String revId,BuildContext context) async {
    try {
      LikeReviewModel? data = await ResidenceServices.removeUnLikeToReview(
          reviews?[selectedIndexOfReview ?? 0].id ?? "", context);
      if (data?.status == "success") {
        print(data?.message);
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }
  }

  getDataOfRecommendationResidences(int Id,BuildContext context) async {
    isLoading = true;
    try {
      r.RecommendationModel? response =
          await ResidenceServices.fetchRecommendedResidences(
              Id, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        data = response.data ?? [];

        // Print or access other properties as needed
        print("Number of residences: ${data?.length}");

        descriptionGalleryReview();

      }


    } catch (e) {
      print("Exception occurred: $e");

    }
  }
getReviewOneOfResidence(String resId,BuildContext context) async {
  try {

    or.GetOneReviewModel? response =
    await ResidenceServices.fetchReviewsOfOneResidences(
        resId, context);
    print("API Response Status: ${response?.status}");

    if (response == null) {
      print("Some error occurred: Response is null");
    } else {
      review = response.review;

      // Print or access other properties as needed
      print("Number of residences: ${images?.length}");

    }


    update();
  } catch (e) {
    print("Exception occurred: $e");

  }
}
  descriptionGalleryReview(){
    if (selectedIndex == 0) {


      listViewItem = [];
      descriptionOrGalleryOrReview = "Description";
      for (var index = 0; index < 2; index = index + 1) {
        listViewItem.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(

                margin: EdgeInsets.only(
                  left: 25,
                ),
                width: Get.width,
                height: 69.95,

                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Container(
                    width: 77.5,
                    height: 69.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xfffffbfe),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(0, 16),
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 6.0),
                          child: Image(
                              image: AssetImage(homeDeatilsIcons[0])),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 5.0),
                          child: Text(
                            "${residence?.totalarea??0}",

                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: kRegularFont,
                                color:  Color(0xff53587A)),
                          ),

                        ),
                        Text(
                          homeDetailsTitles[0],
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: kRegularFont,
                              color: Color(0xff53587A)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 77.5,
                    height: 69.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xfffffbfe),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(0, 16),
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Image(
                              image: AssetImage(homeDeatilsIcons[1])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "${residence?.bedroomAbvGr??0}",

                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: kRegularFont,
                                color: const Color(0xff53587A)),
                          ),

                        ),
                        Text(
                          homeDetailsTitles[1],
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: kRegularFont,
                              color: Color(0xff53587A)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 77.5,
                    height: 69.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xfffffbfe),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(0, 16),
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 6.0),
                          child: Image(
                              image: AssetImage(homeDeatilsIcons[2])),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 5.0),
                          child: Text(
                            "${residence?.totalbaths??0}" ,


                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: kRegularFont,

                                color: const Color(0xff53587A)),
                          ),

                        ),
                        Text(
                          homeDetailsTitles[2],
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: kRegularFont,
                              color: Color(0xff53587A)),
                        ),
                      ],
                    ),
                  )
                ],)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 110,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Listing Agent",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),

                        child: Image(
                          image: AssetImage("lib/assets/images/AgetPhoto.png"),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Sandeep S.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  fontFamily: kRegularFont,
                                  color: kVeryDarkBlueColor),
                            ),
                            Text(
                              "Partner",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  fontFamily: kRegularFont,
                                  color: Color(0xff8C8C8C)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(

                      onPressed: () {
                        Get.to(()=>NewChatScreen());
                      },

                      icon: Image(
                        image: AssetImage("lib/assets/images/message.png"),
                      ))

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(

                  width: 110,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Facilities",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(

                  margin: const EdgeInsets.only(left: 5,right: 5),
                  width: Get.width,
                  height: Get.height*0.12,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: GridView.builder(
                      controller: scroll,
                      physics: const NeverScrollableScrollPhysics(),

                      itemBuilder: (context, index) {
                        return Container(
                          width: 150,

                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xfffffbfe),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,

                                    offset: Offset(0, 16),

                                    blurRadius: 10)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding:

                                const EdgeInsets.only(top: 8.0, bottom: 10),
                                child: Image(
                                    image:
                                    AssetImage(homeFacilitiesIcons[index])),
                              ),
                              Text("${index==0?residence?.garageCars??0:index==1?residence?.bsmtUnfSf??0:index==2?residence?.poolArea??0:residence?.kitchenQual}")
                              ,Container(
                                width:90,

                                child: Center(
                                  child: Text(
                                    homeFacilitiesTitles[index],
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: kRegularFont,
                                        color: const Color(0xff6B6B6B)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },

                      itemCount: homeFacilitiesIcons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 25),


                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    width: 120,

                    child: Center(
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontFamily: kRegularFont,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: kVeryDarkBlueColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(

                child: Container(
                  height: Get.height * 0.29,
                  width: Get.width * 0.85,
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.22,
                        width: Get.width * 0.85,

                        child: Image(
                          image: const AssetImage("lib/assets/images/map12.png"),
                          fit: BoxFit.fill,
                          height: Get.height * 0.2,
                          width: Get.width * 0.85,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(

                          width: Get.width * 0.85,
                          height: Get.height * 0.07,
                          decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              )),

                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Select on the map",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: kRegularFont,
                                    color: kVeryDarkBlueColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top:15 ),
                  child: Container(
                    width: Get.width*0.6,
                    height: Get.height*0.04,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),
                    child: Center(
                      child: Text("property details",style: TextStyle(
                          color: kDarkBlueColor,
                          fontSize:15,
                          fontWeight: FontWeight.w700,
                          fontFamily: kRegularFont
                      ),),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: Container(
                padding: EdgeInsets.only(right:5,left: 5,bottom: 10),
                margin: EdgeInsets.only(bottom: 20),
                decoration:BoxDecoration(
                    color: kLightGreyColor,
                    borderRadius: BorderRadius.circular(20)
                ) ,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width*0.4,
                            child: Text("MsZoning :"
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.mszoning??""
                            ,style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Sale condition : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.saleCondition??"",maxLines: 2,style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Month of sold : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text("${residence?.moSold??" "}",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Sale Type : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.saleType??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Foundation : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.foundation??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Street : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.street??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Roof style : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.roofStyle??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Roof Material : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.roofMatl??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Building Type : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.bldgType??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Lot-shape (General shape of property) : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.lotShape??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("House Style : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.houseStyle??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Alley : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.alley??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Masonry Veneer type : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text("${residence?.masVnrArea??" "}",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Masonry Veneer type : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.masVnrType??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Exterior Covering on house 1 : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.exterior1St??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Exterior Covering on house 2 :",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.exterior2Nd??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Condition 1 :",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.condition1??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Garage Type : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.garageType??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Unfinished square feet of basement area :",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text("${residence?.bsmtUnfSf??" "}",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("Basement exposure : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.bsmtExposure??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4
                            ,
                            child: Text("Heating : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text(residence?.heating??"",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.4,
                            child: Text("House age : ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text("${residence?.houseage??" "}",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:Get.width*0.35,
                            child: Text("House remodel age: ",
                              maxLines: 2
                              ,style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                          ),
                          Text("${residence?.houseremodelage??" "}",style: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Recommended for you ",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: kRegularFont,
                      color: kVeryDarkBlueColor

                  ),),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: ListView.builder(
                controller: scroll,
                physics: const BouncingScrollPhysics(),
                itemCount: data?.length??0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap:(){
                          selectedIndex=index;
                          getDataOfOneResidences("${data?[selectedIndex].datumId}", context);

                        },

                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffF5F5F5)),
                              borderRadius: BorderRadius.circular(20),
                              color: kVeryLightGreyColor),
                          width: 250,
                          height: Get.height * 0.27,
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Container(
                                height: 130,
                                width: 250,
                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: NetworkImage(
                                        data?[index].images?[0].url??""),
                                    width: 280,
                                    height: 140,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  data?[index].title??"",
                                  style: TextStyle(
                                      color: const Color(0xff2F2F2F),
                                      fontFamily: kRegularFont,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 3),
                                child: Text(
                                  "\$${data?[index].salePrice}",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: kRegularFont),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 8,
                                    height: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: kGreyColor,
                                      size: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      width: 126,
                                      child: Text(
                                        data?[index].location?.fullAddress??"",
                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                            color: kGreyColor,
                                            fontFamily: kRegularFont,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),

                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        favSelectedIndex=index;
                                        if(data?[favSelectedIndex??0].isLiked==true){
                                          removeResidenceFromFav("${data?[favSelectedIndex??0].id}",context);
                                          getDataOfRecommendationResidences(Id,context);
                                        update();
                                        }else{
                                         addResidenceToFav("${data?[favSelectedIndex??0].id}", context);
                                          getDataOfRecommendationResidences(Id,context);
                                        update();
                                        }
                                      },
                                      icon: Icon(
                                        Icons.favorite_rounded,
                                        color: kGreyColor,
                                        size: 27,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  );
                },
              ),
              width: Get.width,
              height: Get.height * 0.28,
            ),
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 15),
              padding: EdgeInsets.only(top: 5,bottom: 15),

              width: Get.width,
              height: Get.height * 0.12,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(0, -12),
                        blurRadius: 15)
                  ]),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "Total Price",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [

                            Text(

                              "\$${residence?.salePrice}",

                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  fontFamily: kRegularFont),
                            ),




                          ],
                        ),
                      )
                    ],
                  ),
                  CustomElevatedButtonWidget(
                      text: "Book Now",

                      onPressed: () {
                          Get.to(()=>PredictionPriceForDetail(resId: residence?.residenceId??"",));
                      },

                      textStyle: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: kRegularFont),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(165, 46),
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))

                ],
              ),
            )
          ],
        ));
      }
    } else if (selectedIndex == 1) {
      listViewItem = [];

      descriptionOrGalleryOrReview = "Gallery";
      for (var index = 0; index < 2; index = index + 1) {
        listViewItem.add(Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Row(
                children: [
                  Text(
                    "Gallery",
                    style: TextStyle(
                        color: kVeryDarkBlueColor,
                        fontFamily: kRegularFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${residence?.images?.length}",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kRegularFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.95,
              height: Get.height * 0.8,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: residence?.images?.length??0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                        width: 161,
                        height: 155,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.43)),
                        child: Image(
                          image: NetworkImage(residence?.images?[0].url??""),
                          fit: BoxFit.fill,
                          width: 161,
                          height: 155,
                        ));
                  }),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(0, -12),
                        blurRadius: 15)
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "Total Price",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "\$350",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  fontFamily: kRegularFont),
                            ),
                            Text(
                              " /month",
                              style: TextStyle(
                                  fontFamily: kRegularFont,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff8C8C8C)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomElevatedButtonWidget(
                      text: "Book Now",
                      onPressed: () {},
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: kRegularFont),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(165, 46),
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))
                ],
              ),
            )
          ],

        ));
      }
    } else if (selectedIndex == 2) {
      listViewItem = [];


      descriptionOrGalleryOrReview = "Review";
      for (var index = 0; index <= 2; index = index + 1) {
        listViewItem.add(
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Reviews",
                    style: TextStyle(
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: kDarkBlueColor
                    ),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: Get.width*0.95,
              height: Get.height*0.35,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  controller: scroll,
                  itemBuilder:
                  (context,index){
                return Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10,left: 5),
                                    width:50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius:BorderRadius.circular(50),
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            reviews?[index].userId?.image?.url??""
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width*0.3,
                                    child: Text(reviews?[index].userId?.username??"",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: kDarkBlueColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: kRegularFont),),)
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.access_time_filled_outlined,color: Colors.green,size: 15,),
                                  ),
                                  Container(
                                    width:Get.width*0.3,
                                    child: Text("${reviews?[index].updatedAt}",style: TextStyle(

                                        color: kGreyColor,
                                        fontFamily: kRegularFont,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12
                                    ),
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                            width: Get.width*0.95,
                            child: Text(
                              reviews?[index].comment??'',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: kRegularFont
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: RatingBar.builder(
                                      initialRating: reviews?[index].rating?.toDouble()??0.0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      ignoreGestures: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemBuilder: (context, _) =>
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xffEEA651),
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ),
                                  Text(
                                    "${reviews?[index].rating}",
                                    style: TextStyle(
                                        fontFamily: kRegularFont,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: kVeryDarkBlueColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Helpful?",style: TextStyle(
                                      color: kGreyColor,
                                      fontFamily: kRegularFont,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12
                                  ),),
                                  IconButton(onPressed: (){
                                    selectedDisLike=index;
                                    if(selectedDisLike==index){
                                   addUnLikeToReview(reviews?[selectedDisLike ?? 0].id ?? "",userId,context);

                                    }
                                  }, icon: Icon(Icons.thumb_down_rounded,color:Colors.red,size: 18,)),
                                  Text("${reviews?[index].unLikes}"),
                                  IconButton(onPressed: (){
    bool test4 = Get.isRegistered<SingleDetailController>();
    if(test4){
    Get.delete<SingleDetailController>();}
                                    addLikeToReview(reviews?[selectedDisLike ?? 0].id ?? "",userId,context);
                                  }, icon: Icon(Icons.thumb_up_rounded,color:Colors.green,size: 18,)),
                                  Text("${reviews?[index].likes}"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
                  separatorBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(top: 5,bottom: 10),
                      height: 2,width: Get.width,color: kVeryDarkBlueColor,);
                  }, itemCount: reviews?.length??0),

            ),
            Container(
              margin: EdgeInsets.only(top: 5,bottom:5),
              padding: EdgeInsets.only(bottom:15),
              width: Get.width,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(0, -12),
                        blurRadius: 15)
                  ]),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButtonWidget(
                      text: "Add Review",
                      onPressed: () {
                        Get.to(()=>AddReviewScreen(resId: residence?.residenceId??"",));
                      },
                      textStyle: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: kRegularFont),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width*0.7, 46),
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))

                ],
              ),
            )

          ],
        ));

      }
    }

    isLoading=false;
    update();

  }


}
