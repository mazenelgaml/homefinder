import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/widget/box_widget.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utilities/colors.dart';
import '../../utilities/constants.dart';
import 'controller/feature_estates_controller.dart';

class FeaturedEstates extends StatefulWidget {
  const FeaturedEstates({super.key});



  @override
  State<FeaturedEstates> createState() => _FeaturedEstatesState();
}

class _FeaturedEstatesState extends State<FeaturedEstates> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FeatureEstatesController(context),
        builder: (FeatureEstatesController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height * 0.13,
              leading: const CustomArrowBack(),
              leadingWidth: Get.width * 0.2,
              title: Text("Featured Estates ", style: TextStyle(
                  color: kDarkBlueColor,
                  fontFamily: kRegularFont,
                  fontSize: 23,
                  fontWeight: FontWeight.w900
              )),
            ),

            body:controller.isLoading
                ? Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFFfddfef),
                rightDotColor: const Color(0xFF8a81d2),
                size: 200,
              ),
            )
                : SingleChildScrollView(
              child: Column(
                children: [

                  Center(
                    child: Container(
                      height: Get.height * 0.93,
                      color: const Color(0xffF7F7F7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: Get.height * 0.07),
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.scroll,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 250),
                            itemCount: controller.residences?.length ?? 0,
                            itemBuilder: (_, int index) {
                              return Box(

                                onTap:(){
                                  controller.SelectedHouse=index;
                                  controller.getDataOfOneResidence(controller.residences?[controller.SelectedHouse??0].id??0,controller.residences?[controller.SelectedHouse??0].residenceId??"");
                                },
                                favCol: controller.residences?[index].isLiked==true?kPrimaryColor:Colors.grey,
                                onPressed: (){
                                  controller.favSelectedIndex=index;
                                  if(controller.residences?[controller.favSelectedIndex??0].isLiked==true){
                                    controller.removeResidenceFromFav(controller.residences![index].residenceId??"",context);
                                    controller.getDataOfResidences();
                                    setState(() {

                                    });}else{
                                    controller.addResidenceToFav(controller.residences?[index].residenceId??"", context);
                                    controller.getDataOfResidences();
                                    setState(() {

                                    });
                                  }
                                },
                                location: "${controller.residences?[index].location?.city}, ${controller.residences?[index].location?.state}, ${controller.residences?[index].location?.country}",
                                price:"\$ ${ controller.residences?[index].salePrice}",
                                title:controller.residences?[index].title ,
                               image: controller.residences?[index].images?[0].url, index: index,);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          );
        });
  }
}
