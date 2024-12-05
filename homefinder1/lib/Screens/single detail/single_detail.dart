
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:homefinder1/Screens/single%20detail/controller/single_detail_controller.dart';
import 'package:homefinder1/utilities/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Widget/custom_elevated_button_widget.dart';
import '../../utilities/colors.dart';
import '../ChatingScreens/new_chat_screen/new_chat_screen.dart';


class SingleDetailScreen extends StatefulWidget {
  String resId;
  int Id;

  SingleDetailScreen(this.Id, this.resId);




  @override
  State<SingleDetailScreen> createState() => _SingleDetailScreenState();

}

class _SingleDetailScreenState extends State<SingleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleDetailController>(

        init: SingleDetailController(widget.Id, widget.resId, context),
        builder: (SingleDetailController controller) {
          return Scaffold(
            body: controller.isLoading?Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFFe9d9e9),
                rightDotColor: const Color(0xFF8a81d2),
                size: 200,
              ),
            )

                :SingleChildScrollView(
              controller: controller.scroll,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.35,
                    child: Stack(
                      children: <Widget>[
                        Image(

                          image: NetworkImage(
                              controller.residence?.images?[0].url ?? ""),
                          width: double.infinity,
fit: BoxFit.fill,
                        ),
                        Positioned(
                            top: 50,
                            left: 20,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Image(
                                  image: AssetImage(
                                      "lib/assets/images/Icon Back.png")),
                            )),
                        Positioned(
                          top: 50,
                          right: 20,
                          child: InkWell(
                            onTap: (){

                             controller.love=kPrimaryColor;
                              if(controller.residence?.isLiked==true){

                                controller.removeResidenceFromFav(controller.residence?.residenceId??"",context);
                                controller.update();
                              }else{
                                controller.addResidenceToFav(controller.residence?.residenceId??"", context);
                                setState(() {
                                  controller.update();
                                });
                              }
                            },
                            child: Icon(Icons.favorite_rounded,size:35
                            ,color: controller.love,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [

                          const Icon(
                            Icons.star,
                            color: Color(0xffEEA651),
                          ),

                          Text(
                            "${controller.residence?.avgRating} (${controller.reviews?.length})",
                            style: TextStyle(
                                color: kGreyColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                              color: const Color(0xffF4F6F9),
                              border: Border.all(
                                color: const Color(0xffF4F6F9),
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              controller.residence?.category??"",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: kRegularFont),
                            ),
                          )),
                    )
                  ]),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        controller.residence?.title??"",
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontFamily: kRegularFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text("${controller.residence?.location?.city}, ${controller.residence?.location?.state}, ${controller.residence?.location?.country}",
                            style: TextStyle(
                                color: const Color(0xff415770),
                                fontSize: 12,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w500)),
                      )
                    ],


                  ),
                  Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 10),
                        child: Container(
                          width: 73,
                          height: 50,
                          decoration: BoxDecoration(
                              color: controller.residence?.type=="rent"?kPrimaryColor:kLightGreyColor,
                              border: Border.all(color: controller.residence?.type=="rent"?kPrimaryColor:kLightGreyColor, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                                "Rent",
                                style: TextStyle(
                                    color: controller.residence?.type=="rent"?Colors.white:kDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontWeight: controller.residence?.type=="rent"?FontWeight.w800:FontWeight.w500,
                                    fontSize: 12),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 73,
                          height: 50,
                          decoration: BoxDecoration(
                              color: controller.residence?.type=="sale"?kPrimaryColor:kLightGreyColor,
                              border: Border.all(color: controller.residence?.type=="sale"?kPrimaryColor:kLightGreyColor, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                                "Sell",
                                style: TextStyle(
                                    color: controller.residence?.type=="sale"?Colors.white:kDarkBlueColor,
                                    fontFamily: kRegularFont,
                                    fontWeight: controller.residence?.type=="sale"?FontWeight.w800:FontWeight.w500,
                                    fontSize: 12),
                              )),
                        ),
                      )
                    ],
                  ),
                  Center(
                      child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: Get.width * 0.9,
                    height: Get.height*0.05,

                    child: Center(
                      child: ListView.separated(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.selectedIndex = index;
                               controller.descriptionGalleryReview();
                                setState(() {});
                              },
                              child: Center(
                                child: Text(
                                  controller.pOrLOrS[index],
                                  style: TextStyle(
                                      color: controller.selectedIndex == index
                                          ? kPrimaryColor
                                          : kDarkBlueColor,
                                      fontFamily: kRegularFont,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            );
                          },
                          dragStartBehavior: DragStartBehavior.down,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 60);
                          },
                          itemCount: controller.pOrLOrS.length),
                    ),
                  )),
                  Divider(
                    color: controller.selectedIndex == controller.pOrLOrS
                        ? kPrimaryColor
                        : kGreyColor,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                      width: Get.width,
                      child: Center(
                          child: controller
                              .listViewItem[controller.selectedIndex]))
                ],
              ),

            ),
          );
        });
  }
}
