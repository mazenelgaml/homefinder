// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utilities/colors.dart';
import '../../utilities/constants.dart';
import 'controller/favorite_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<FavoriteController>(
        init: FavoriteController(context),
        builder: (FavoriteController controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      controller.removeAllFav(context);
                      controller.getDataOfFavResidences(context);
                      setState(() {

                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.red.shade300,
                          blurRadius: 10
                        )],
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete,
                              size: 23,
                              color: Colors.white,
                            ),
                            Text("Delete All",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: kRegularFont
                            ),),
                          ],
                        ),
                      ),

                    ),
                  ),

                )
              ],
              toolbarHeight: Get.height * 0.09,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CustomArrowBack(),
              ),
              leadingWidth: 80,
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Favourites",
                  style: TextStyle(
                    color: kDarkBlueColor,
                    fontSize: 20,
                    fontFamily: kRegularFont,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            body: controller.isLoading
                ? Center(
                    child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: const Color(0xFFe9d9e9),
                      rightDotColor: const Color(0xFF8a81d2),
                      size: 200,
                    ),
                  )
                :controller.favsCount!=0?SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: controller.scroll,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: Get.width,
                          height: Get.height,
                          child: ListView.builder(
                              controller: controller.scroll,
                              itemCount: controller.favs?.length ?? 0,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: Get.width * 0.95,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: Colors.white),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0, 0),
                                                blurRadius: 10)
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              width: 105,
                                              height: 115,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: Image(
                                                  image: NetworkImage(controller
                                                          .favs?[index]
                                                          .images?[0]
                                                          .url ??
                                                      ""),
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(top: 8,right: 5),
                                                width: Get.width*0.65,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          color: Color(0xffEEA651),
                                                        ),

                                                        Text(
                                                          "${controller.favs?[index].rating}",
                                                          style: TextStyle(
                                                              color: kGreyColor,
                                                              fontFamily:
                                                                  kRegularFont,
                                                              fontWeight:
                                                                  FontWeight.w600),
                                                        ),
                                                      ],
                                                    ),

                                                    Container(
                                                      height: 30,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              const Color(0xffF4F6F9),
                                                          border: Border.all(
                                                            color:
                                                                const Color(0xffF4F6F9),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25)),
                                                      child: Center(
                                                        child: Text(
                                                          controller.favs?[index]
                                                                  .category ??
                                                              "",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontFamily:
                                                                  kRegularFont),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    controller.favs?[index]
                                                            .title ??
                                                        "",
                                                    style: TextStyle(
                                                        color: kDarkBlueColor,
                                                        fontFamily:
                                                            kRegularFont,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                                                  Container(
                                                    width: Get.width*0.5,
                                                    child: Text(
                                                      overflow: TextOverflow.ellipsis,

                                                      "${controller.favs?[index].location}",
                                                      style: TextStyle(
                                                          color:
                                                              const Color(0xff415770),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              kRegularFont,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: Get.width*0.65,
                                                margin: const EdgeInsets.only(left: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Container(
                                                      width:100,
                                                      child: Text(
                                                        overflow: TextOverflow.ellipsis,
                                                        "\$${controller.favs?[index].salePrice}",
                                                        style: TextStyle(
                                                            color: kPrimaryColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 13,
                                                            fontFamily:
                                                                kRegularFont),
                                                      ),
                                                    ),

                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.favorite_rounded,
                                                          color: kPrimaryColor,
                                                          size: 25,
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
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
                  ):
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25,left: 15),
                  padding: const EdgeInsets.only(top: 15,left: 5),
                  child: Row(


                    children: [
                      Text("0 ",style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 18,
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w900,
                      )),
                      Text("estates",style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 18,
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w600,
                      ))
                    ],
                  ),
                ),
                Center(child: Container(
                  margin: const EdgeInsets.only(top: 35),
                  height: Get.height*0.3,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 151,width: 163,child: const Image(image: AssetImage("lib/assets/images/SuccessIllustration.png"),fit: BoxFit.fill,height: 151,width: 163,)),

                      ],
                    ),

                  ),),),
                Text("Your favorite page is",style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 25,
                  fontFamily: kRegularFont,
                  fontWeight: FontWeight.w600,
                )),
                Text("empty",style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 25,
                  fontFamily: kRegularFont,
                  fontWeight: FontWeight.w900,
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text("Click add button above to start exploring and",style: TextStyle(
                    color: const Color(0xff53587A),
                    fontSize: 12,
                    fontFamily: kRegularFont,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                Center(
                  child: Text("choose your favorite estates.",style: TextStyle(
                    color: const Color(0xff53587A),
                    fontSize: 12,
                    fontFamily: kRegularFont,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ],
            )
          );
        });
  }
}
