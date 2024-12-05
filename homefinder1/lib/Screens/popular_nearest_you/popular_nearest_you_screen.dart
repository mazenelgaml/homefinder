import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/popular_nearest_you/controller/popular_nearest_you_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';

import '../../utilities/colors.dart';
import '../../utilities/constants.dart';
import '../Featured Estates/widget/box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/widget/box_widget.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class PopularNearestYou extends StatefulWidget{
  const PopularNearestYou({super.key});

  @override
  State<PopularNearestYou> createState() => _PopularNearestYouState();
}

class _PopularNearestYouState extends State<PopularNearestYou> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PopularNearestYouController(context),
        builder: (PopularNearestYouController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height * 0.13,
              leading: const CustomArrowBack(),
              leadingWidth: Get.width * 0.2,
              title: Text("Popular Nearest You ", style: TextStyle(
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

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF4F4F4),
                        hintText: "Search House, Apartment , etc",
                        prefixIcon: const Icon(
                          Icons.search_outlined, color: Colors.black,),
                        suffixIcon: InkWell(
                            onTap: () {},
                            child: const Image(image: AssetImage(
                                'lib/assets/images/options.png'))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xffF4F4F4),
                              width: 3,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6C63FF),
                              width: 3,
                            )
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.845,
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