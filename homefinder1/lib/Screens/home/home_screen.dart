// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/featured_estates.dart';
import 'package:homefinder1/Screens/booked/booked_screen.dart';
import 'package:homefinder1/Screens/home/controller/home_controller.dart';
import 'package:homefinder1/Screens/popular_nearest_you/popular_nearest_you_screen.dart';
import 'package:homefinder1/Screens/single%20detail/single_detail.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Widget/custom_bottom_navigation_bar_widget.dart';
import '../ChatingScreens/chatlist/chats_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return  GetBuilder<HomeController>(
        init: HomeController(context),
    builder: (HomeController controller) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.088,
        leadingWidth: Get.width*0.5,
        leading:  Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage("lib/assets/images/locationIcon 1.png"),
                    width: 28,
                    height: 28,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kRegularFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                  Text(
                    "Manhattan, New York",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [SizedBox(
        width: Get.width*0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap:(){
                Get.to(()=>BookedResidences());
              },
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(55)),
                child:  Center(
                    child: Icon(Icons.bookmark_outlined,color: kPrimaryColor,size: 30,),

                    )),
              ),

            InkWell(
              onTap: (){
                Get.to(()=>const ChatsListScreen());
              },
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(55)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Image(
                        image: AssetImage(
                            "lib/assets/images/ChatNotifIcon.png"),
                        width: 23,
                        height: 23,
                      ),
                    ),
                    Text(
                      "Chat",
                      style: TextStyle(
                          fontFamily: kRegularFont,
                          fontWeight: FontWeight.w700,
                          fontSize: 11),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),],),

      body: controller.isLoading

          ? Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFFe9d9e9),
          rightDotColor: const Color(0xFF8a81d2),
          size: 200,
        ),
      )

          :SafeArea(

        child: SizedBox(
          height: Get.height*0.85,
          child: SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
            controller: controller.scroll,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width * 0.96,
                  height: 109,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discover",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18),
                            ),
                            Text(
                              "Find your",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 23),
                            ),
                            Text(
                              "Best Living Places.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 23),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 47,
                      ),
                      const Image(
                        image: AssetImage("lib/assets/images/HomeRecImage.png"),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: kDarkBlueColor,
                      border: Border.all(color: kDarkBlueColor),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  height: 15,
                ),




                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Popular Nearest You",
                      style: TextStyle(
                          color: kDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 85,
                    ),
                    TextButton(
                        onPressed: () {Get.to(()=>const PopularNearestYou());},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: kRegularFont),
                        )),
                  ],
                ),
                SizedBox(
                  child: ListView.builder(
                    controller: controller.scroll,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap:(){
                              controller.SelectedResidenceIndex1=index;

                              setState(() {

                              });


                              Get.to(()=>SingleDetailScreen(controller.nearestResidences?[controller.SelectedResidenceIndex1??0].id??0,controller.nearestResidences?[controller.SelectedResidenceIndex1??0].residenceId??""));

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
                                          controller.nearestResidences?[index].images?[0].url??""),
                                        width: 280,
                                        height: 140,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      controller.nearestResidences?[index].title??"",
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
                                      "\$${controller.nearestResidences?[index].salePrice}",
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
                                            controller.nearestResidences?[index].location?.fullAddress??"",
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
                                          onPressed: ()  {

                                            controller.favSelectedIndex1=index;
                                            if(controller.residences?[controller.favSelectedIndex1].isLiked==true){

                                              controller.removeResidenceFromFav(controller.residences?[controller.favSelectedIndex1??0].residenceId??"",context);
                                              controller.update();
                                            }else{
                                              controller.addResidenceToFav(controller.residences?[controller.favSelectedIndex1??0].residenceId??"", context);
                                              setState(() {
                                                controller.update();
                                              });
                                            }
                                          },
                                          icon: Icon(
                                            Icons.favorite_rounded,
                                            color: controller.residences?[index].isLiked==true?kPrimaryColor:Colors.grey,
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
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Featured Estates",
                      style: TextStyle(
                          color: kDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    TextButton(
                        onPressed: () {Get.to(()=>const FeaturedEstates());},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: kRegularFont),
                        )),
                  ],
                ),
                Container(
                  width: Get.width,
                  height: Get.height*0.7,
                  child: ListView.builder(
                    controller: controller.scroll,
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(

                              onTap:(){

                                controller.SelectedResidenceIndex=index;

                                setState(() {

                                });


                                Get.to(()=>SingleDetailScreen(controller.residences?[controller.SelectedResidenceIndex??0].id??0,controller.residences?[controller.SelectedResidenceIndex??0].residenceId??""));

                              }
                              ,
                              child: Container(
                                width: Get.width * 0.95,
                                height: Get.height * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 0),
                                          blurRadius: 10)
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 5,),
                                    Container(
                                        width: 105,
                                        height: 110,

                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image(
                                            image:
                                                NetworkImage(controller.residences?[index].images?[0].url??""),
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Color(0xffEEA651),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "${controller.residences?[index].avgRating}",
                                              style: TextStyle(
                                                  color: kGreyColor,
                                                  fontFamily: kRegularFont,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 148,
                                            ),
                                            Container(
                                              height: 30,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF4F6F9),
                                                  border: Border.all(
                                                    color: const Color(0xffF4F6F9),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25)),
                                              child: Center(
                                                child: Text(
                                                  controller.residences?[index].category??"",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: kRegularFont),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              controller.residences?[index].title??"",
                                              style: TextStyle(
                                                  color: kDarkBlueColor,
                                                  fontFamily: kRegularFont,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.location_on,
                                              color: Color(0xff415770),
                                              size: 17,
                                            ),
                                            Text(
                                              "${controller.residences?[index].location?.city??""}, ${controller.residences?[index].location?.state??""}, ${controller.residences?[index].location?.country??""}",
                                              style: TextStyle(
                                                  color: const Color(0xff415770),
                                                  fontSize: 12,
                                                  fontFamily: kRegularFont,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: Get.width*0.65,
                                          margin: const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [

                                              Container(
                                                width:100,
                                                child: Text(
                                                  
                                                  "\$${controller.residences?[index].salePrice}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 13,
                                                      fontFamily: kRegularFont),
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(right: 10.0,top: 10),
                                                child: InkWell(
                                                    onTap: () {

                                                      controller.favSelectedIndex=index;
                                                      if(controller.residences?[controller.favSelectedIndex].isLiked==true){

                                                      controller.removeResidenceFromFav(controller.residences?[controller.favSelectedIndex??0].residenceId??"",context);
                                                      controller.update();
                                                      }else{
                                                        controller.addResidenceToFav(controller.residences?[controller.favSelectedIndex??0].residenceId??"", context);
                                                        setState(() {
                                                          controller.getDataOfResidences(context);
                                                        });
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.favorite_rounded,
                                                      color: controller.residences?[index].isLiked==true?kPrimaryColor:Colors.grey,
                                                      size: 25,
                                                    )),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBarWidget(),
    );});
  }
}
