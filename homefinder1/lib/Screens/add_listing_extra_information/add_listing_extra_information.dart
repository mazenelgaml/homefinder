
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';


class AddListingExtraInformation extends StatefulWidget{
  const AddListingExtraInformation({super.key});


  @override
  State<AddListingExtraInformation> createState() => _AddListingExtraInformationState();
}

class _AddListingExtraInformationState extends State<AddListingExtraInformation> {

  final List gridview = [
    {
      "image" : "lib/assets/images/Bed.png" ,
       "number" : "2",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "3",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "4",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "5",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "6",
    },
  ];

  Color contColor1=kLightGreyColor;

  Color contColor2=kLightGreyColor;

  Color contColor3=kLightGreyColor;

  Color contColor4=kLightGreyColor;

  Color contColor5=kLightGreyColor;

  Color contColor6=kLightGreyColor;

  Color contColor7=kLightGreyColor;

  Color textColor1 = kDarkBlueColor;

  Color textColor2 = kDarkBlueColor;

  Color textColor3 = kDarkBlueColor;

  Color textColor4 = kDarkBlueColor;

  Color textColor5 = kDarkBlueColor;

  Color textColor6 = kDarkBlueColor;

  Color textColor7 = kDarkBlueColor;

  Color garden = kDarkBlueColor ;

  Color gardenText = kDarkBlueColor;

  Color gym = kDarkBlueColor ;

  Color gymText = kDarkBlueColor;

  Color homeTheatre = kDarkBlueColor ;

  Color homeTheatreText = kDarkBlueColor;

  Color kidsFriend = kDarkBlueColor ;

  Color kidsFriendText = kDarkBlueColor;

  Color bed2 = kDarkBlueColor;

  Color bedtext2 = kDarkBlueColor;

  var selectedIndex;

  int counter1 = 1;
  int counter2 = 1;
  int counter3 = 1;

  void incrementCounter1() {
    setState(() {
      counter1++;
    });
  }

  void decrementCounter1() {
    setState(() {
      counter1--;
    });
  }

  void incrementCounter2() {
    setState(() {
      counter2++;
    });
  }

  void decrementCounter2() {
    setState(() {
      counter2--;
    });
  }

  void incrementCounter3() {
    setState(() {
      counter3++;
    });
  }

  void decrementCounter3() {
    setState(() {
      counter3--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.width*0.13),
            Row(children: [const CustomArrowBack(),
              SizedBox(width: Get.width*0.1,),
              Text("Add Listing",style: TextStyle(fontFamily: kRegularFont,fontWeight: FontWeight.w900,fontSize: 23,color: kDarkBlueColor),),
            ],),
            SizedBox(height: Get.height*0.09,),
            Row(children: [
              SizedBox(width: Get.width*0.02,),

              Text(" Almost finish, ",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: kDarkBlueColor,fontFamily: kRegularFont),),
              Text("complete",
                style: TextStyle(fontSize: 25,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),),
            ],),
            Row(
              children: [
                Text("  the listing" ,style: TextStyle(fontSize: 25,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),
                ),
              ],
            ),

            SizedBox(height: Get.height*0.05,),
            Text("    sell price" , style: TextStyle(
              fontSize: 20 , fontFamily: kRegularFont,fontWeight: FontWeight.w600,
                color: kDarkBlueColor
            ),),
            const SizedBox(height: 10,),
            Center(
              child: SizedBox(
                height: Get.height*0.15,
                width: Get.width*0.87,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top:Get.height*0.075),
                    filled: true,
                    fillColor: const Color(0xffF4F4F4),
                    hintText: "      \$ 100,000",
                    hintStyle: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                        fontSize: 15),

                    suffixIcon: const Image(image: AssetImage('lib/assets/images/dollar sign.png')),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 3,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff6C63FF),
                          width: 3,
                        )
                    ),
                  ),
                ),
              ),
            ),

            Text("    Rent Price" , style: TextStyle(
                fontSize: 20 , fontFamily: kRegularFont,fontWeight: FontWeight.w600,
                color: kDarkBlueColor
            ),),
            const SizedBox(height: 10,),
             Center(
               child: SizedBox(
                height: Get.height*0.15,
                width: Get.width*0.87,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top:Get.height*0.075),
                    filled: true,
                    fillColor: const Color(0xffF4F4F4),
                    hintText: "      \$ 3l5/month",
                    hintStyle: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                        fontSize: 15),

                    suffixIcon: const Image(image: AssetImage('lib/assets/images/dollar sign.png')),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 3,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff6C63FF),
                          width: 3,
                        )
                    ),
                  ),
                ),
                           ),
             ),

    Row(

      children: [const SizedBox(width: 40,),
        InkWell(onTap:(){
        if (contColor3==kLightGreyColor&&textColor3==kDarkBlueColor){ {

        }  setState(() {
        textColor3=Colors.white;contColor3=kPrimaryColor;
        });}else{setState(() {
        contColor3=kLightGreyColor;
        textColor3=kDarkBlueColor;
        });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor3,border: Border.all(color: contColor3,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Monthly",
        style: TextStyle(color: textColor3,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
          const SizedBox(width: 20,),
        InkWell(onTap:(){
          if (contColor4==kLightGreyColor&&textColor4==kDarkBlueColor){ {

          }  setState(() {
            textColor4=Colors.white;contColor4=kPrimaryColor;
          });}else{setState(() {
            contColor4=kLightGreyColor;
            textColor4=kDarkBlueColor;
          });}},child: Container(width: 93,height: 50,decoration: BoxDecoration(color:contColor4,border: Border.all(color: contColor4,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Yearly",
          style: TextStyle(color: textColor4,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),

      ],
    ),
            SizedBox(height: Get.height*0.045,),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text("  Property Features",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
          )),),
            const SizedBox(height: 10,),
            Center(
              child: Container(
                height: Get.height*0.11,
                width: Get.width*0.87,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffF4F4F4),
                ),

                child:
                     Row(
                      children: [
                        Text("   Bedroom" , style:  TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                            fontSize: 15),),
                        const SizedBox(width: 170,),
                        InkWell(
                          onTap: (){
                            decrementCounter1();
                          },
                          child: const Image(image: AssetImage('lib/assets/images/Delete - Icon.png'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text('$counter1' , style: const TextStyle(fontSize: 20),),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            incrementCounter1();
                          },
                            child: const Image(image: AssetImage('lib/assets/images/Add - Icon.png')))
                      ],
                    ),
                    

                  ),
                ),
               const SizedBox(height: 30,),


            Center(
              child: Container(
                height: Get.height*0.11,
                width: Get.width*0.87,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffF4F4F4),
                ),

                child:
                Row(
                  children: [
                    Text("   Bathroom" , style:  TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                        fontSize: 15),),
                    const SizedBox(width: 160,),
                    InkWell(
                      onTap: (){
                        decrementCounter2();
                      },
                      child: const Image(image: AssetImage('lib/assets/images/Delete - Icon.png'),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text('$counter2' , style: const TextStyle(fontSize: 20),),
                    const SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          incrementCounter2();
                        },
                        child: const Image(image: AssetImage('lib/assets/images/Add - Icon.png')))
                  ],
                ),


              ),
            ),
            const SizedBox(height: 30,),

            Center(
              child: Container(
                height: Get.height*0.11,
                width: Get.width*0.87,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffF4F4F4),
                ),

                child:
                Row(
                  children: [
                    Text("   Balcony" , style:  TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                        fontSize: 15),),
                    const SizedBox(width: 180,),
                    InkWell(
                      onTap: (){
                        decrementCounter3();
                      },
                      child: const Image(image: AssetImage('lib/assets/images/Delete - Icon.png'),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text('$counter3' , style: const TextStyle(fontSize: 20),),
                    const SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          incrementCounter3();
                        },
                        child: const Image(image: AssetImage('lib/assets/images/Add - Icon.png')))
                  ],
                ),


              ),
            ),
            const SizedBox(height: 30,),


            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("  Total Rooms",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
              )),),

            Container(
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white38,

              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ,mainAxisSpacing: 20),
                    itemCount: gridview.length,
                    itemBuilder:  (_ , index) {
                      return InkWell(onTap:(){

                         selectedIndex = index;
                         setState(() {

                         });
                       },child: Container(width: 100,height: 70,
                        decoration: BoxDecoration(
                            color: selectedIndex ==index?kPrimaryColor:kLightGreyColor,
                            border: Border.all(color: Colors.transparent,width:1 ),
                            borderRadius: BorderRadius.circular(15) ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image(image: AssetImage("${gridview.elementAt(index)['image']}")),
                            ),

                            Center(child: Text("${gridview.elementAt(index)['number']}",
                              style: TextStyle(color: selectedIndex==index?Colors.white:kDarkBlueColor,
                                  fontFamily: kRegularFont,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13),)),
                          ],
                        ),),);


                }),
              ),
            ),
               const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("  Enviroment/Facilites",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
              )),),
              const SizedBox(height: 10,),
            Row(children: [SizedBox(width: Get.width*0.07,),
              InkWell(onTap:(){
                if (contColor1==kLightGreyColor&&textColor1==kDarkBlueColor){ {

                }  setState(() {
                  textColor1=Colors.white;contColor1=kPrimaryColor;
                });}else{setState(() {
                  contColor1=kLightGreyColor;
                  textColor1=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:contColor1,border: Border.all(color: contColor1,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Parking Lot",
                style: TextStyle(color: textColor1,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
               const SizedBox(width: 50,),
              InkWell(onTap:(){
                if (contColor2==kLightGreyColor&&textColor2==kDarkBlueColor){ {

                }  setState(() {
                  textColor2=Colors.white;contColor2=kPrimaryColor;
                });}else{setState(() {
                  contColor2=kLightGreyColor;
                  textColor2=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:contColor2,border: Border.all(color: contColor2,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Pet Allowed",
                style: TextStyle(color: textColor2,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),
                const SizedBox(height: 20,),
            Row(children: [SizedBox(width: Get.width*0.04,),
              InkWell(onTap:(){
                if (garden==kLightGreyColor&&gardenText==kDarkBlueColor){ {

                }  setState(() {
                  gardenText=Colors.white;garden=kPrimaryColor;
                });}else{setState(() {
                  garden=kLightGreyColor;
                  gardenText=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:garden,border: Border.all(color: garden,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Garden",
                style: TextStyle(color: gardenText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
             const SizedBox(width: 30,),
              InkWell(onTap:(){
                if (gym==kLightGreyColor&&gymText==kDarkBlueColor){ {

                }  setState(() {
                  gymText=Colors.white;gym=kPrimaryColor;
                });}else{setState(() {
                  gym=kLightGreyColor;
                  gymText=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:gym,border: Border.all(color: gym,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Gym",
                style: TextStyle(color: gymText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
             const SizedBox(width: 30,),
              InkWell(onTap:(){
                if (contColor5==kLightGreyColor&&textColor5==kDarkBlueColor){ {

                }  setState(() {
                  textColor5=Colors.white;contColor5=kPrimaryColor;
                });}else{setState(() {
                  contColor5=kLightGreyColor;
                  textColor5=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:contColor5,border: Border.all(color: contColor5,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Park",
                style: TextStyle(color: textColor5,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),
            const SizedBox(height: 20,),

            Row(children: [SizedBox(width: Get.width*0.08,),
              InkWell(onTap:(){
                if (homeTheatre==kLightGreyColor&&homeTheatreText==kDarkBlueColor){ {

                }  setState(() {
                  homeTheatreText=Colors.white;homeTheatre=kPrimaryColor;
                });}else{setState(() {
                  homeTheatre=kLightGreyColor;
                  homeTheatreText=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:homeTheatre,border: Border.all(color: homeTheatre,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Home Theatre",
                style: TextStyle(color: homeTheatreText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
              const SizedBox(width: 50,),
              InkWell(onTap:(){
                if (kidsFriend==kLightGreyColor&&kidsFriendText==kDarkBlueColor){ {

                }  setState(() {
                  kidsFriendText=Colors.white;kidsFriend=kPrimaryColor;
                });}else{setState(() {
                  kidsFriend=kLightGreyColor;
                  kidsFriendText=kDarkBlueColor;
                });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:kidsFriend,border: Border.all(color: kidsFriend,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Kid's friendly",
                style: TextStyle(color: kidsFriendText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),

             const SizedBox(height: 50,),
            Center(
              child: Container(
                width: 210,
                height: 64,
                decoration: BoxDecoration(color: kPrimaryColor,border: Border.all(color: kPrimaryColor,width: 1),borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )
                    ),
                      context: context,
                      builder: (context) =>Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Image(image: AssetImage("lib/assets/images/Slide-bottomsheet.png")),
                            ),
                            const SizedBox(height: 10,),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(image: AssetImage("lib/assets/images/Congrats.png")),
                            ),
                            const SizedBox(height: 20,),
                            Text("Your Listing is now" ,
                              style: TextStyle(fontSize: 25,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),
                        ),
                            Text("published" , style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: kDarkBlueColor,fontFamily: kRegularFont),),
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                              SizedBox(
                                width:150,
                                height: 64,
                                child: ElevatedButton(onPressed: (){},
                                style:  ElevatedButton.styleFrom(backgroundColor: kVeryLightGreyColor,
                                    fixedSize: const Size(200,70)), child:Text( "Add more",style: TextStyle(color: Colors.black,fontFamily: kRegularFont,fontSize: 20,fontWeight: FontWeight.w700,),)),
                                ),
                                  const SizedBox(width: 70,),
                                  Container(
                                    width: 130,
                                    height: 64,
                                    decoration: BoxDecoration(color: kPrimaryColor,border: Border.all(color: kPrimaryColor,width: 1),borderRadius: BorderRadius.circular(20)),

                                    child: ElevatedButton(style:  ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
                                          fixedSize: const Size(200,70))  ,                                               onPressed: (){},child:Text( "Finish",style: TextStyle(color: Colors.white,fontFamily: kRegularFont,fontSize: 20,fontWeight: FontWeight.w700,),),
                                    ),
                                  ),
                              ]
                              ),
                            ),
                              ],
                            ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
                        fixedSize: const Size(200,70)), child:Text( "Submit",style: TextStyle(color: Colors.white,fontFamily: kRegularFont,fontSize: 20,fontWeight: FontWeight.w700,),)),
              ),
            ),
          ],),
        ),
      );

  }
}