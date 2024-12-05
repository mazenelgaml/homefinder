// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore, avoid_print, unnecessary_null_comparison, depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:homefinder1/Screens/edit_listing/edit_listing_screen.dart';
import 'package:homefinder1/Screens/edit_profile/controller/edit_profile_controller.dart';
import 'package:homefinder1/services/auth_service.dart';
import 'package:homefinder1/services/residences_services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/fourth_complete_model.dart'as f;
import '../../../models/gat_pending_for_user.dart';
import '../../../models/get_user_model.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utilities/memory.dart';
import '../../settings/controller/settings_controller4.dart';

class ProfileController extends GetxController{
  Uint8List? imageBytes;
       BuildContext context;
ProfileController(this.context);
  User? data ;
  GetUserModel? data1;
  bool isLoading=true;
  int? slectedDelete;
  int pendingCount=0;
  int approvedCount=0;
  int soldCount=0;
  List<String> pOrLOrS=["Pending","Approved","Sold"];
  int selectedIndex=0;
  List<String> housesNames=["Wings Tower","Bridgeland Modern House"];
  List<String>housesPhotos=["lib/assets/images/pending1.png","lib/assets/images/pending2.png"];
  int selectedIndex1=0;
  List<int>prices=[370,320];
  List<String>listingHousesNames=["Fairview Apartment","Shoolview House"];
  late List<Widget> listViewItem = [];
  String pendingOrListingOrSold="Pending";
  ScrollController scrollController=ScrollController();
int? SelectedResidenceIndex1;
  @override
  void onInit()async {
    super.onInit();
    getdata();
  }
  @override




  Future<void> pickImage(BuildContext context) async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (source != null) {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();


        imageBytes = bytes;
        isLoading=true;

        update();
        // Navigate to UploadPreview page immediately after picking the image
        uploadImage(context, bytes);
      }
    }
  }
  Future<void> uploadImage(BuildContext context, Uint8List imageBytes) async {
    // Convert the image bytes to a file
    final tempDir = await getTemporaryDirectory();
    final file = await  File('${tempDir.path}/image.jpg').create();
    await file.writeAsBytes(imageBytes);

    // Retrieve authorization token
    String? token =  Get.find<StorageService>().getToken;
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
        update();
        isLoading=true;
        getdata();
        isLoading=false;
        update();
        bool test4 = Get.isRegistered<EditProfileController>();
        if(test4){
          Get.delete<SettingsController>();
          Get.delete<EditProfileController>();
        }

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
  getdata() async
  {
    isLoading=true;
    update();
      var response = await AuthServices.fetchUserData();

      if (response == null) {
        print("some error occured");
      } else {
        data= response.user;
        data1=response;
        pendingCount=data1?.pendingCount??0;
        approvedCount=data1?.approvedCount??0;
        soldCount=data1?.soldCount??0;
        getDataOfpendingResidences(context);

      }







  }

  List<Residence>? soldResidences ;
  int counterOfSoldResidences=0;
  bool isLoadingMoreDataOfSoldResidences=false;
  int maxNoOfPagesOfSoldResidences=1;
  int soldResidenceCount=0;







  List<Residence>? pendingResidences ;
  int counterOfpendingResidences=0;
  bool isLoadingMoreDataOfpendingResidences=false;
  int maxNoOfPagesOfpendingResidences=1;
int pendingResidenceCount=0;

  getDataOfpendingResidences(BuildContext context) async {

    if (counterOfpendingResidences == 0) {
      try {
        GetPendingResidencesModel? response = await AuthServices.fetchUserPendingData(counterOfpendingResidences, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          pendingResidences = response.residences ?? [];
          pendingResidenceCount = response.count ?? 0;

          // Print or access other properties as needed
          print("Number of residences: ${pendingResidences?.length}");
          getDataOfApprovedResidences();
        }



      } catch (e) {
        print("Exception occurred: $e");

      }
    } else {

    }
  }


int? selectedPending;
  List<Residence>? approvedResidences ;
  int counterOfApprovedResidences=1;
  bool isLoadingMoreDataOfApprovedResidences=false;
  int maxNoOfPagesOfApprovedResidences=1;
  int approvedResidenceCount=0;

  getDataOfApprovedResidences() async
  {

    if (counterOfApprovedResidences == 0) {
      try {
        GetPendingResidencesModel? response = await ResidenceServices.fetchUserapprovedData(counterOfApprovedResidences, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          approvedResidences = response.residences ?? [];
          approvedResidenceCount = response.count ?? 0;

          // Print or access other properties as needed
          print("Number of residences: ${approvedResidences?.length}");

        }


      } catch (e) {
        print("Exception occurred: $e");

      }
    } isLoading=false;
    update();
  }


  Future<void> removeResidence(String resId,BuildContext context) async {
    try {
      f.FourthCompleteModel? data = await ResidenceServices.deleteOneResidence(
          context,
          resId
      );
      if (data?.status == "success") {

        print(data?.residence);
        update();

        bool test4 = Get.isRegistered<ProfileController>();
        if(test4){
          Get.delete<ProfileController>();


        }
      }else{

      }
    } catch (e) {

      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);

    }
  }



}
