// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class ChooseCameraSource extends StatelessWidget {
//   const ChooseCameraSource(
//       {Key? key, required this.openCamera, required this.openGallery})
//       : super(key: key);
//   final Function openCamera;
//   final Function openGallery;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height * 0.25,
//       width: Get.width,
//       padding: const EdgeInsets.all(10),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(25), topLeft: Radius.circular(25),),
//       ),
//
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: GestureDetector(
//               child: const Icon(Icons.clear, size: 25, color: kDarkTealColor,),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   openCamera();
//                 },
//                 child: Container(
//                   width: Get.width * 0.8,
//                   height: 70,
//                   decoration: const BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(color: kDarkTealColor, width: 1)
//                       )
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: Row(
//                       children: <Widget>[
//                         SvgPicture.asset(
//                             "camera_icon.svg", width: 30,
//                             height: 30,
//                             color: kDarkTealColor),
//                         const SizedBox(width: 10,),
//                         Text(cameraSource1.tr, style: const TextStyle(
//                             fontSize: 12.0,
//                             fontFamily: 'elmessiri',
//                             color: kDarkTealColor
//                         ),),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   openGallery();
//                 },
//                 child: Container(
//                   width: Get.width * 0.8,
//                   height: 70,
//                   decoration: const BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(color: kDarkTealColor, width: 1)
//                       )
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: Row(
//                       children: <Widget>[
//                         SvgPicture.asset(
//                             "gallery_icon.svg", width: 30,
//                             height: 30,
//                             color: kDarkTealColor),
//                         const SizedBox(width: 10,),
//                         Text(cameraSource2.tr, style: const TextStyle(
//                             fontSize: 12.0,
//                             fontFamily: 'elmessiri',
//                             color: kDarkTealColor
//                         ),),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//
//         ],
//       ),
//
//     );
//   }
// }