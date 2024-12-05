import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:homefinder1/utilities/colors.dart';


class LoadingChatListWidget extends StatelessWidget {
  const LoadingChatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      physics: const BouncingScrollPhysics(),

      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemCount:5,
      itemBuilder: (_, index) =>  InkWell(
          onTap: (){
          },
          child: SizedBox(
            height: Get.height*0.18,
            child:  Column(
              children: [
                Container(
                  decoration:  BoxDecoration(
                    color:kPrimaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                            .slide(),
                        const SizedBox(width:10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFDFDDDF),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(10))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                            const SizedBox(height: 10,),
                            Container(
                              width: 200,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFDFDDDF),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(10))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                 Divider(
                  color: kPrimaryColor,
                  height: 1,
                  thickness: 2,

                ),
              ],
            ),
          )
      ),
    ).animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color:  kPrimaryColor.withAlpha(85))
        .animate() // this wraps the previous Animate in another Animate
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
        .slide();
  }
}
