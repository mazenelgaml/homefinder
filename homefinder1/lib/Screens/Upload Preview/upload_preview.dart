// ignore: unnecessary_import
// ignore_for_file: unnecessary_null_comparison, depend_on_referenced_packages, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Set%20Location/set_location.dart';

import 'package:path_provider/path_provider.dart';


import '../../Widget/custom_arrow_back.dart';
import '../../utilities/memory.dart';

class UploadPreview extends StatelessWidget{
  const UploadPreview({super.key, required this.imageBytes});

  final Uint8List imageBytes;

  Future<void> uploadImage(BuildContext context, Uint8List imageBytes) async {
    // Convert the image bytes to a file
    final tempDir = await getTemporaryDirectory();
    final file = await  File('${tempDir.path}/image.jpg').create();
    await file.writeAsBytes(imageBytes);

    // Retrieve authorization token
    String? token = Get.find<StorageService>().getToken;
    if (token == null) {
      print('Authorization token is null.');
      return;
    }

    // Prepare the upload request
    var request = http.MultipartRequest('POST', Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/user/upload-image'));

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers['Authorization'] = token;

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');
        Get.to(()=>const SetLocation());
      } else {
        // If the status code is not success, show the error in CoolAlert
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title:"Error",
          text: response.reasonPhrase,
        );
      }
    } catch (e) {
      // If an exception occurs, show the error in CoolAlert
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: "$e",
      );
      print('Error occurred while uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          toolbarHeight: Get.height*0.12,
          leading: const CustomArrowBack(),
          leadingWidth: Get.width*0.2,
    ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomArrowBack(),
            const Text("Upload Your Photo" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
            const Row(

              children: [
                Text("Profile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
              ],
            ),

            const SizedBox(height: 15,),
            const Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
            const Row(children:[
              Text("      for seccurity" , style: TextStyle(fontSize: 15),)
            ] ),
            const SizedBox(height: 50,),
            const Image(image: AssetImage('lib/assets/images/User.png')),
            const SizedBox(height: 200,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
               Get.to(() =>  const SetLocation());
              }
                ,
                style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ) ,
                ),
                child: const Row(
                  children: [
                    Text("          Next" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    Icon(Icons.navigate_next , size: 30,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }

}