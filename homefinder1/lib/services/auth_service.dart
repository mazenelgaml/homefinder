

// ignore_for_file: non_constant_identifier_names, await_only_futures, avoid_print, use_build_context_synchronously, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:homefinder1/models/add_review_to_residence_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/get_user_model.dart';
import 'package:homefinder1/models/log_out_model.dart';
import 'package:homefinder1/models/serification_model.dart';
import '../models/auth_model.dart';
import '../models/delete_account_model.dart';
import '../models/delete_account_photo_model.dart';
import '../models/forget_password_model.dart';
import '../models/gat_pending_for_user.dart'as gp;
import '../models/update_profile_data_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';

class AuthServices{
  static ApiService api = ApiService();
  static Future<AuthModel?> signingIn(String email,String password,BuildContext context) async {
    var data = await api.request(context: context,Services.signingInEndPoint, "POST",data: {
      "email":email,
      "password":password,
    });
    if (data != null) {
      return AuthModel.fromJson(data);

    }
    return null;
  }
  static Future<gp.GetPendingResidencesModel?> fetchUserPendingData(int counter, BuildContext context) async {
    const String endPoint = 'residence/pending';

    try {
      final response = await ApiService().request(
        '$endPoint?page=$counter',
        'GET',
        headers: {
          "Authorization": await Get.find<StorageService>().getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return gp.GetPendingResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<AuthModel?> signingUp(String username,String email,String password,String confirmPass,BuildContext context) async {
    var data = await api.request(context: context,Services.signingUpEndPoint, "POST",data: {
     "username":username,
      "email":email,
      "password":password,
      "confirmPass":confirmPass,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> completeSigningUp(String firstName,String lastName,String gender,String phone,BuildContext context) async {
    var data = await api.request(context: context,Services.completeSigningUpEndPoint, "POST",data: {
      "firstName":firstName,
      "lastName":lastName,
      "gender":gender,
      "phone":phone,
    },headers: {
      "Authorization":await Get.find<StorageService>().getToken
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<VerificationModel?> SendingVerificationCode(BuildContext context,code) async {
    var data = await api.request(context: context,Services.verificationCodeEndPoint, "POST",data: {
      "otp": code,
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return VerificationModel.fromJson(data);
    }
    return null;
  }
  static Future<VerificationModel?> reSendingVerificationCode(BuildContext context) async {
    var data = await api.request(context: context,"auth/resend-code", "GET",data: {
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return VerificationModel.fromJson(data);
    }
    return null;
  }
  static Future<ForgetPaaswordModel?> forgetPassword(String email,BuildContext context) async {
    var data = await api.request(context: context,Services.forgetPasswordEndPoint, "POST",data: {
      "email":email,
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return ForgetPaaswordModel.fromJson(data);
    }
    return null;
  }
  static Future<LogOutModel?> signOut(BuildContext context) async {
    var data = await api.request(context: context,Services.signOutEndPoint, "GET",data: {
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return LogOutModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> resetPassword(String password,String confirmPass,BuildContext context,String email) async {
    var data = await api.request(context: context,Services.resetPasswordEndPoint+email, "PATCH",data: {
      "password":password,
      "confirmPass":confirmPass
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<DeleteAccountModel?> deleteAccount(String password,BuildContext context) async {
    var data = await api.request(context: context,Services.deleteAccountEndPoint, "DELETE",data: {
      "password":password,
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return DeleteAccountModel.fromJson(data);
    }
    return null;
  }
  static Future<DeleteAccountModel?>changePassword(String oldPassword,String password,String confirmPass,BuildContext context) async {
    var data = await api.request(context: context,Services.changePasswordEndPoint, "PATCH",data: {
      "oldPassword":oldPassword,
      "newPassword":password,
      "confirmPass":confirmPass
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return DeleteAccountModel.fromJson(data);
    }
    return null;
  }
  static Future<GetUserModel?> fetchUserData() async {
    const String getUserEndPoint = 'https://home-finder-back-end-i7ca.onrender.com/api/v1/user/get-user'; // Example URL

    try {
      // Make GET request
      final response = await http.get(
        Uri.parse(getUserEndPoint),
        headers: {
          "Authorization":await Get.find<StorageService>().getToken, // Replace with your token retrieval method
        },
      );

      // Check if request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse JSON response
        final jsonData = jsonDecode(response.body);

        // Check if the JSON structure matches the expected format
        if (jsonData['status'] == 'success') {
          return GetUserModel.fromJson(jsonData);
        } else {
          print('API Error: ${jsonData['message']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return null; // Return null if there's any error or invalid response
  }
  static Future<UpdateProfileDataModel?> updateProfileData(String firstName,String lastName,String gender,String phone,String username,BuildContext context) async {
    var data = await api.request(context: context,Services.updateUserEndPoint, "PATCH",data: {
      "firstName":firstName,
      "gender":gender,
      "username":username,
      "lastName":lastName,
      "phone":phone,
    },headers:{
      "Authorization":await Get.find<StorageService>().getToken,
    } );
    if (data != null) {
      return UpdateProfileDataModel.fromJson(data);
    }
    return null;
  }
  static Future<DeleteAccountPhotoModel?> deleteAccountPhoto(BuildContext context) async {
    var data = await api.request(context: context,Services.deleteAccountPhotoEndPoint, "DELETE",data: {
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return DeleteAccountPhotoModel.fromJson(data);
    }
    return null;
  }
  static Future<VerificationModel?> SendingVerificationCodeForget(BuildContext context,code,String email) async {
    var data = await api.request(context: context,Services.verificationCodeForgetEndPoint+email, "POST",data: {
      "otp": code,
    });
    if (data != null) {
      return VerificationModel.fromJson(data);
    }
    return null;
  }
  static Future<VerificationModel?> reSendingVerificationCodeForget(BuildContext context,String email) async {
    var data = await api.request(context: context,"auth/resend-pass-otp/"+email, "POST",data: {
    });
    if (data != null) {
      return VerificationModel.fromJson(data);
    }
    return null;
  }
  static Future<AddReviewToResidenceModel?> addReview(int rating,String comment,String resId,BuildContext context) async {
    var data = await api.request(context: context,"review/${resId}", "POST",data: {
      "rating":rating,
      "comment":comment,
    },headers: {
      "Authorization":await Get.find<StorageService>().getToken
    });
    if (data != null) {
      return AddReviewToResidenceModel.fromJson(data);
    }
    return null;
  }
}