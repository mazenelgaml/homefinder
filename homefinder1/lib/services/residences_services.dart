
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/first_complete_model.dart';
import 'package:homefinder1/models/first_edit_model.dart';
import 'package:homefinder1/models/fourth_complete_model.dart';

import 'package:homefinder1/models/get_all_reviews_of_residence_model.dart';

import 'package:homefinder1/models/get_one_review_model.dart';

import 'package:homefinder1/models/like_review_model.dart';
import 'package:homefinder1/models/price_prediction_model.dart';
import 'package:homefinder1/models/recomendation_model.dart';

import 'package:homefinder1/models/fourth_edit_model.dart';

import 'package:homefinder1/models/get_sold_for_profile_model.dart';
import 'package:homefinder1/models/second_edit_model.dart';

import 'package:homefinder1/models/third_complete_model.dart';
import 'package:homefinder1/models/third_edit_model.dart';
import 'package:homefinder1/models/update_residence_model.dart';
import '../models/create_residence_first.dart';
import '../models/gat_pending_for_user.dart';
import '../models/get_all_reesidences_model.dart'as rr;
import '../models/get_nearest_residences_model.dart';
import '../models/get_one_residence_model.dart'as r;
import '../models/get_residence_images_model.dart';
import '../models/get_user_favorite_model.dart';
import '../models/respose_model.dart';
import '../models/second_complete_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';

class ResidenceServices {

  static ApiService api = ApiService();

  static Future<CreateResidence?> createResidence(String title, String type,
      String category, BuildContext context,) async {
    print(title + "," + type + "," + category + ",");
    print(Services.createResidence);

    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(
        context: context, Services.createResidence, "POST", data: {
      "title": title,
      "type": type,
      "category": category,
    }, headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return CreateResidence.fromJson(data);
    }
    return null;
  }

  static Future<FirstCompleteModel?> FirstComplete(String neighborhood,
      String mszoning,
      String saleCondition, int moSold, int salePrice,
      String paymentPeriod, String saleType,
      List<String> utilities,
      String lotShape,
      String electrical,
      String foundation,
      String bldgType,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.firstCompleteEndPoint + residanceId,
        "POST",
        data: {
          "neighborhood": neighborhood,
          "mszoning": mszoning,
          "saleCondition": saleCondition,
          "moSold": moSold,
          "salePrice": salePrice,
          "paymentPeriod": paymentPeriod,
          "saleType": saleType,
          "utilities": utilities,
          "lotShape": lotShape,
          "electrical": electrical,
          "foundation": foundation,
          "bldgType": bldgType,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FirstCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<SecondCompleteModel?> secondComplete(String roofStyle,
      String roofMatl,
      String houseStyle
      , String msSubClass,
      String centralAir,
      String street,
      String alley,
      String heating,
      String heatingQc,
      String masVnrType,
      int masVnrArea,
      String exterior1st,
      String exterior2nd,
      String exterCond,
      String exterQual,
      String condition1,
      String condition2,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.secondCompleteEndPoint + residanceId,
        "POST",
        data: {
          "roofStyle": roofStyle,
          "roofMatl": roofMatl,
          "houseStyle": houseStyle,
          "msSubClass": msSubClass,
          "centralAir": centralAir,
          "street": street,
          "alley": alley,
          "heating": heating,
          "heatingQc": heatingQc,
          "masVnrType": masVnrType,
          "masVnrArea": masVnrArea,
          "exterior1st": exterior1st,
          "exterior2nd": exterior2nd,
          "exterCond": exterCond,
          "exterQual": exterQual,
          "condition1": condition1,
          "condition2": condition2
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return SecondCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<ThirdCompleteModel?> thirdComplete(bool hasGarage,
      String garageType,
      String garageQual,
      int garageCars,
      String garageFinish,
      bool hasBasement,
      bool hasFireplace,
      int fireplaces,
      String fireplaceQu,
      int bedroomAbvGr,
      int totalbaths,
      int KitchenAbvGr,
      String kitchenQual,
      int totRmsAbvGrd,
      int bsmtUnfSF,
      String bsmtExposure,
      String bsmtFinType1,
      String bsmtQual,
      String bsmtCond,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.thirdCompleteEndPoint + residanceId,
        "POST",
        data: {
          "hasGarage": hasGarage,
          "garageType": garageType,
          "garageQual": garageQual,
          "garageCars": garageCars,
          "garageFinish": garageFinish,
          "hasBasement": hasBasement,
          "hasFireplace": hasFireplace,
          "fireplaces": fireplaces,
          "fireplaceQu": fireplaceQu,
          "bedroomAbvGr": bedroomAbvGr,
          "totalbaths": totalbaths,
          "kitchenQual": kitchenQual,
          "KitchenAbvGr": KitchenAbvGr,
          "totRmsAbvGrd": totRmsAbvGrd,
          "bsmtUnfSF": bsmtUnfSF,
          "bsmtExposure": bsmtExposure,
          "bsmtCond": bsmtCond,
          "bsmtFinType1": bsmtFinType1,
          "bsmtQual": bsmtQual,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return ThirdCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<FourthCompleteModel?> fourthComplete(String lotConfig,
      String landContour,
      String landSlope,
      String pavedDrive,
      int poolArea,
      int overallQual,
      int overallCond,
      int totalarea,
      int totalporchsf,
      int lotArea,
      int lotFrontage,
      int totalsf,
      int lowQualFinSF,
      int miscVal,
      int houseage,
      int houseremodelage,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.fourthCompleteEndPoint + residanceId,
        "POST",
        data: {
          "lotConfig": lotConfig,
          "landContour": landContour,
          "landSlope": landSlope,
          "pavedDrive": pavedDrive,
          "poolArea": poolArea,
          "overallQual": overallQual,
          "overallCond": overallCond,
          "totalarea": totalarea,
          "totalporchsf": totalporchsf,
          "lotArea": lotArea,
          "lotFrontage": lotFrontage,
          "totalsf": totalsf,
          "lowQualFinSF": lowQualFinSF,
          "miscVal": miscVal,
          "houseage": houseage,
          "houseremodelage": houseremodelage,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FourthCompleteModel.fromJson(data);
    }
    return null;
  }


  static Future<UpdateResidence?> updateResidence(String title, String type,
      String category, BuildContext context, String resId) async {
    print(title + "," + type + "," + category + ",");
    print(Services.updateResidence);

    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(

        context: context
        , "residence/update/${resId}",
        "PATCH",
        data: {

          "title": title,
          "type": type,
          "category": category,
        }, headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return UpdateResidence.fromJson(data);
    }
    return null;
  }


  static Future<FirstEditModel?> FirstEdit(String neighborhood,
      String mszoning,
      String saleCondition, int moSold, int salePrice,
      String paymentPeriod, String saleType,
      List<String> utilities,
      String lotShape,
      String electrical,
      String foundation,
      String bldgType,
      BuildContext context,

      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.firstUpdateEndPoint + residanceId,
        "PATCH",
        data: {
          "neighborhood": neighborhood,
          "mszoning": mszoning,
          "saleCondition": saleCondition,
          "moSold": moSold,
          "salePrice": salePrice,
          "paymentPeriod": paymentPeriod,
          "saleType": saleType,
          "utilities": utilities,
          "lotShape": lotShape,
          "electrical": electrical,
          "foundation": foundation,
          "bldgType": bldgType,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FirstEditModel.fromJson(data);
    }
    return null;
  }

  static Future<SecondEditModel?> secondEdit(String roofStyle,
      String roofMatl,
      String houseStyle
      , String msSubClass,
      String centralAir,
      String street,
      String alley,
      String heating,
      String heatingQc,
      String masVnrType,
      int masVnrArea,
      String exterior1st,
      String exterior2nd,
      String exterCond,
      String exterQual,
      String condition1,
      String condition2,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.secondUpdateEndPoint + residanceId,
        "PATCH",
        data: {
          "roofStyle": roofStyle,
          "roofMatl": roofMatl,
          "houseStyle": houseStyle,
          "msSubClass": msSubClass,
          "centralAir": centralAir,
          "street": street,
          "alley": alley,
          "heating": heating,
          "heatingQc": heatingQc,
          "masVnrType": masVnrType,
          "masVnrArea": masVnrArea,
          "exterior1st": exterior1st,
          "exterior2nd": exterior2nd,
          "exterCond": exterCond,
          "exterQual": exterQual,
          "condition1": condition1,
          "condition2": condition2
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return SecondEditModel.fromJson(data);
    }
    return null;
  }

  static Future<ThirdEditModel?> thirdEdit(bool hasGarage,
      String garageType,
      String garageQual,
      int garageCars,
      String garageFinish,
      bool hasBasement,
      bool hasFireplace,
      int fireplaces,
      String fireplaceQu,
      int bedroomAbvGr,
      int totalbaths,
      int KitchenAbvGr,
      String kitchenQual,
      int totRmsAbvGrd,
      String bsmtUnfSF,
      String bsmtExposure,
      String bsmtFinType1,
      String bsmtQual,
      String bsmtCond,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.thirdUpdateEndPoint + residanceId,
        "PATCH",
        data: {
          "hasGarage": hasGarage,
          "garageType": garageType,
          "garageQual": garageQual,
          "garageCars": garageCars,
          "garageFinish": garageFinish,
          "hasBasement": hasBasement,
          "hasFireplace": hasFireplace,
          "fireplaces": fireplaces,
          "fireplaceQu": fireplaceQu,
          "bedroomAbvGr": bedroomAbvGr,
          "totalbaths": totalbaths,
          "kitchenQual": kitchenQual,
          "KitchenAbvGr": KitchenAbvGr,
          "totRmsAbvGrd": totRmsAbvGrd,
          "bsmtUnfSF": bsmtUnfSF,
          "bsmtExposure": bsmtExposure,
          "bsmtCond": bsmtCond,
          "bsmtFinType1": bsmtFinType1,
          "bsmtQual": bsmtQual,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return ThirdEditModel.fromJson(data);
    }
    return null;
  }


  static Future<FourthEditModel?> fourthEdit(String lotConfig,
      String landContour,
      String landSlope,
      String pavedDrive,
      int poolArea,
      int overallQual,
      int overallCond,
      int totalarea,
      int totalporchsf,
      int lotArea,
      int lotFrontage,
      int totalsf,
      int lowQualFinSF,
      int miscVal,
      int houseage,
      int houseremodelage,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.fourthUpdateEndPoint + residanceId,
        "PATCH",
        data: {
          "lotConfig": lotConfig,
          "landContour": landContour,
          "landSlope": landSlope,
          "pavedDrive": pavedDrive,
          "poolArea": poolArea,
          "overallQual": overallQual,
          "overallCond": overallCond,
          "totalarea": totalarea,
          "totalporchsf": totalporchsf,
          "lotArea": lotArea,
          "lotFrontage": lotFrontage,
          "totalsf": totalsf,
          "lowQualFinSF": lowQualFinSF,
          "miscVal": miscVal,
          "houseage": houseage,
          "houseremodelage": houseremodelage,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FourthEditModel.fromJson(data);
    }
    return null;
  }

  static Future<FourthCompleteModel?> deleteOneResidence(BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.deleteOneResidenceEndPoint + residanceId,
        "DELETE",
        data: {
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FourthCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<GetPendingResidencesModel?> fetchUserSoldData(int counter,
      BuildContext context) async {
    const String endPoint = 'residence/sold';

    try {
      final response = await ApiService().request(
        '$endPoint?page=$counter',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetPendingResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<GetPendingResidencesModel?> fetchUserapprovedData(int counter,
      BuildContext context) async {
    const String endPoint = 'residence/approved';

    try {
      final response = await ApiService().request(
        '$endPoint?page=$counter',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetPendingResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<rr.GetAllResidencesModel?> fetchAllResidences(int counter,
      BuildContext context) async {
    const String endPoint = 'residence/all';

    try {
      final response = await ApiService().request(
        '$endPoint?page=$counter',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return rr.GetAllResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<r.GetOneResidencesModel?> fetchOneResidences(String resId,
      BuildContext context) async {


    try {
      final response = await ApiService().request(
        'residence/get/${resId}',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return r.GetOneResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<ResponseModel?> addFavorite(String resId,
      BuildContext context) async {
    var data = await api.request(
        context: context, Services.addFavEndPoint + resId, "GET",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  static Future<ResponseModel?> deleteFavorite(String resId,
      BuildContext context) async {
    var data = await api.request(
        context: context, Services.deleteFavEndPoint + resId, "DELETE",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  static Future<GetUserFavoriteModel?> fetchfavResidences(
      BuildContext context) async {
    const String endPoint = 'user/favorites';

    try {
      final response = await ApiService().request(
        '$endPoint',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetUserFavoriteModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<ResponseModel?> deleteAllFavorite(BuildContext context) async {
    var data = await api.request(
        context: context, Services.deleteFavEndPoint, "DELETE",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  static Future<GetResidencesImagesModel?> fetchImagesOfResidences(String resId,
      BuildContext context) async {
    String endPoint = "residence/images/";

    try {
      final response = await ApiService().request(
        '$endPoint$resId',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetResidencesImagesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<GetAllReviewsOfResidenceModel?> fetchReviewsOfResidences(
      String resId, BuildContext context) async {
    String endPoint = "review/get/$resId";

    try {
      final response = await ApiService().request(
        '$endPoint',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetAllReviewsOfResidenceModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<LikeReviewModel?> addLikeToReview(String reviewId,
      BuildContext context) async {
    var data = await api.request(
        context: context, "review/like/${reviewId}", "GET",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return LikeReviewModel.fromJson(data);
    }
    return null;
  }

  static Future<LikeReviewModel?> removeLikeToReview(String reviewId,
      BuildContext context) async {
    var data = await api.request(
        context: context, "review/remove-like/${reviewId}", "GET",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return LikeReviewModel.fromJson(data);
    }
    return null;
  }

  static Future<LikeReviewModel?> addUnLikeToReview(String reviewId,
      BuildContext context) async {
    var data = await api.request(
        context: context, "review/unlike/${reviewId}", "GET",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return LikeReviewModel.fromJson(data);
    }
    return null;
  }

  static Future<LikeReviewModel?> removeUnLikeToReview(String reviewId,
      BuildContext context) async {
    var data = await api.request(
        context: context, "review/remove-unlike/${reviewId}", "GET",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return LikeReviewModel.fromJson(data);
    }
    return null;
  }

  static Future<PricePeridectionModel?> pricePrediction(String resId,
      BuildContext context) async {
    const String endPoint = 'residence/predict/';
    final String token = Get
        .find<StorageService>()
        .getToken;
    try {
      final response = await ApiService().request(
        'residence/predict/6676c135c7dc590ddae55891',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return PricePeridectionModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<RecommendationModel?> fetchRecommendedResidences(int Id,
      BuildContext context) async {
    const String endPoint = 'residence/recommend/';
    try {
      final response = await ApiService().request(
        '$endPoint${Id}',
        'GET',
        headers: {
          "Authorization": await Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );
      if (response != null && response['status'] == 'success') {
        print(response);
        return RecommendationModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }
    return null;
  }

  static Future<GetOneReviewModel?> fetchReviewsOfOneResidences(String revId,
      BuildContext context) async {
    String endPoint = "review/get-one/$revId";

    try {
      final response = await ApiService().request(
        '$endPoint',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetOneReviewModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }

  static Future<ResponseModel?> deleteResidenceImage(String imgId,
      BuildContext context) async {
    var data = await api.request(
        context: context, "residence/image/${imgId}", "DELETE",
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken,

        });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<GetNearestModel?> fetchAllNearResidences(int counter,
      BuildContext context) async {
    const String endPoint = 'residence/nearest';

    try {
      final response = await ApiService().request(
        '$endPoint?page=$counter',
        'GET',
        headers: {
          "Authorization": Get
              .find<StorageService>()
              .getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetNearestModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }
}



