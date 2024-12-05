// To parse this JSON data, do
//
//     final getOneResidencesModel = getOneResidencesModelFromJson(jsonString);

import 'dart:convert';

GetAllResidencesModel GetAllResidencesFromJson(String str) => GetAllResidencesModel.fromJson(json.decode(str));

String GetAllResidencesModelToJson(GetAllResidencesModel data) => json.encode(data.toJson());

class GetAllResidencesModel {
  String? status;
  int? count;
  List<Residence>? residences;

  GetAllResidencesModel({
    this.status,
    this.count,
    this.residences,
  });

  factory GetAllResidencesModel.fromJson(Map<String, dynamic> json) => GetAllResidencesModel(
    status: json["status"],
    count: json["count"],
    residences: json["residences"] == null ? [] : List<Residence>.from(json["residences"]!.map((x) => Residence.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "residences": residences == null ? [] : List<dynamic>.from(residences!.map((x) => x.toJson())),
  };
}

class Residence {
  bool? isLiked;
  Location? location;
  String? residenceId;
  int? id;
  String? title;
  String? category;
  String? status;
  String? type;
  bool? isSold;
  String? paymentPeriod;
  bool? isCompleted;
  bool? hasGarage;
  bool? hasFireplace;
  bool? hasBasement;
  String? createdAt;
  String? updatedAt;
  List<ImageElement>? images;
  String? msSubClass;
  String? mszoning;
  int? lotFrontage;
  int? lotArea;
  String? street;
  String? lotShape;
  String? landContour;
  String? utilities;
  String? lotConfig;
  String? landSlope;
  String? neighborhood;
  String? condition1;
  String? condition2;
  String? bldgType;
  String? houseStyle;
  int? overallQual;
  int? overallCond;
  String? roofStyle;
  String? roofMatl;
  String? exterior1St;
  String? exterior2Nd;
  String? masVnrType;
  int? masVnrArea;
  String? exterQual;
  String? exterCond;
  String? foundation;
  String? bsmtQual;
  String? bsmtCond;
  String? bsmtExposure;
  String? bsmtFinType1;
  int? bsmtUnfSf;
  String? heating;
  String? heatingQc;
  String? centralAir;
  String? electrical;
  int? lowQualFinSf;
  int? bedroomAbvGr;
  String? kitchenQual;
  int? totRmsAbvGrd;
  int? fireplaces;
  String? fireplaceQu;
  String? garageType;
  String? garageFinish;
  int? garageCars;
  String? garageQual;
  String? pavedDrive;
  int? poolArea;
  int? miscVal;
  int? moSold;
  String? saleType;
  String? saleCondition;
  double? salePrice;
  int? houseage;
  int? houseremodelage;
  int? totalsf;
  int? totalarea;
  double? totalbaths;
  int? totalporchsf;
  String? alley;
  int? avgRating;
  List<dynamic>? likedUsers;
  List<Review>? reviews;
  List<String>? bookedBy;

  Residence({
    this.isLiked,
    this.location,
    this.residenceId,
    this.id,
    this.title,
    this.category,
    this.status,
    this.type,
    this.isSold,
    this.paymentPeriod,
    this.isCompleted,
    this.hasGarage,
    this.hasFireplace,
    this.hasBasement,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.msSubClass,
    this.mszoning,
    this.lotFrontage,
    this.lotArea,
    this.street,
    this.lotShape,
    this.landContour,
    this.utilities,
    this.lotConfig,
    this.landSlope,
    this.neighborhood,
    this.condition1,
    this.condition2,
    this.bldgType,
    this.houseStyle,
    this.overallQual,
    this.overallCond,
    this.roofStyle,
    this.roofMatl,
    this.exterior1St,
    this.exterior2Nd,
    this.masVnrType,
    this.masVnrArea,
    this.exterQual,
    this.exterCond,
    this.foundation,
    this.bsmtQual,
    this.bsmtCond,
    this.bsmtExposure,
    this.bsmtFinType1,
    this.bsmtUnfSf,
    this.heating,
    this.heatingQc,
    this.centralAir,
    this.electrical,
    this.lowQualFinSf,
    this.bedroomAbvGr,
    this.kitchenQual,
    this.totRmsAbvGrd,
    this.fireplaces,
    this.fireplaceQu,
    this.garageType,
    this.garageFinish,
    this.garageCars,
    this.garageQual,
    this.pavedDrive,
    this.poolArea,
    this.miscVal,
    this.moSold,
    this.saleType,
    this.saleCondition,
    this.salePrice,
    this.houseage,
    this.houseremodelage,
    this.totalsf,
    this.totalarea,
    this.totalbaths,
    this.totalporchsf,
    this.alley,
    this.avgRating,
    this.likedUsers,
    this.reviews,
    this.bookedBy,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    isLiked: json["isLiked"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    residenceId: json["_id"],
    id: json["Id"],
    title: json["title"],
    category: json["category"],
    status: json["status"],
    type: json["type"],
    isSold: json["isSold"],
    paymentPeriod: json["paymentPeriod"],
    isCompleted: json["isCompleted"],
    hasGarage: json["hasGarage"],
    hasFireplace: json["hasFireplace"],
    hasBasement: json["hasBasement"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"] ,
    images: json["images"] == null ? [] : List<ImageElement>.from(json["images"]!.map((x) => ImageElement.fromJson(x))),
    msSubClass: json["msSubClass"],
    mszoning: json["mszoning"],
    lotFrontage: json["lotFrontage"],
    lotArea: json["lotArea"],
    street: json["street"],
    lotShape: json["lotShape"],
    landContour: json["landContour"],
    utilities: json["utilities"],
    lotConfig: json["lotConfig"],
    landSlope: json["landSlope"],
    neighborhood: json["neighborhood"],
    condition1: json["condition1"],
    condition2: json["condition2"],
    bldgType: json["bldgType"],
    houseStyle: json["houseStyle"],
    overallQual: json["overallQual"],
    overallCond: json["overallCond"],
    roofStyle: json["roofStyle"],
    roofMatl: json["roofMatl"],
    exterior1St: json["exterior1st"],
    exterior2Nd: json["exterior2nd"],
    masVnrType: json["masVnrType"],
    masVnrArea: json["masVnrArea"],
    exterQual: json["exterQual"],
    exterCond: json["exterCond"],
    foundation: json["foundation"],
    bsmtQual: json["bsmtQual"],
    bsmtCond: json["bsmtCond"],
    bsmtExposure: json["bsmtExposure"],
    bsmtFinType1: json["bsmtFinType1"],
    bsmtUnfSf: json["bsmtUnfSF"],
    heating: json["heating"],
    heatingQc: json["heatingQc"],
    centralAir: json["centralAir"],
    electrical: json["electrical"],
    lowQualFinSf: json["lowQualFinSF"],
    bedroomAbvGr: json["bedroomAbvGr"],
    kitchenQual:json["kitchenQual"],
    totRmsAbvGrd: json["totRmsAbvGrd"],
    fireplaces: json["fireplaces"],
    fireplaceQu: json["fireplaceQu"],
    garageType: json["garageType"],
    garageFinish:json["garageFinish"],
    garageCars: json["garageCars"],
    garageQual: json["garageQual"],
    pavedDrive:json["pavedDrive"],
    poolArea: json["poolArea"],
    miscVal: json["miscVal"],
    moSold: json["moSold"],
    saleType:json["saleType"],
    saleCondition: json["saleCondition"],
    salePrice: json["salePrice"]?.toDouble(),
    houseage: json["houseage"],
    houseremodelage: json["houseremodelage"],
    totalsf: json["totalsf"],
    totalarea: json["totalarea"],
    totalbaths: json["totalbaths"]?.toDouble(),
    totalporchsf: json["totalporchsf"],
    alley: json["alley"],
    avgRating: json["avgRating"],
    likedUsers: json["likedUsers"] == null ? [] : List<dynamic>.from(json["likedUsers"]!.map((x) => x)),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    bookedBy: json["bookedBy"] == null ? [] : List<String>.from(json["bookedBy"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked,
    "location": location?.toJson(),
    "_id": residenceId,
    "Id": id,
    "title": title,
    "category": category,
    "status": status,
    "type": type,
    "isSold": isSold,
    "paymentPeriod": paymentPeriod,
    "isCompleted": isCompleted,
    "hasGarage": hasGarage,
    "hasFireplace": hasFireplace,
    "hasBasement": hasBasement,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "msSubClass": msSubClass,
    "mszoning": mszoning,
    "lotFrontage": lotFrontage,
    "lotArea": lotArea,
    "street": street,
    "lotShape": lotShape,
    "landContour": landContour,
    "utilities": utilities,
    "lotConfig": lotConfig,
    "landSlope": landSlope,
    "neighborhood": neighborhood,
    "condition1": condition1,
    "condition2": condition2,
    "bldgType": bldgType,
    "houseStyle": houseStyle,
    "overallQual": overallQual,
    "overallCond": overallCond,
    "roofStyle": roofStyle,
    "roofMatl": roofMatl,
    "exterior1st": exterior1St,
    "exterior2nd": exterior2Nd,
    "masVnrType": masVnrType,
    "masVnrArea": masVnrArea,
    "exterQual": exterQual,
    "exterCond": exterCond,
    "foundation": foundation,
    "bsmtQual": bsmtQual,
    "bsmtCond": bsmtCond,
    "bsmtExposure": bsmtExposure,
    "bsmtFinType1": bsmtFinType1,
    "bsmtUnfSF": bsmtUnfSf,
    "heating": heating,
    "heatingQc": heatingQc,
    "centralAir": centralAir,
    "electrical": electrical,
    "lowQualFinSF": lowQualFinSf,
    "bedroomAbvGr": bedroomAbvGr,
    "kitchenQual": kitchenQual,
    "totRmsAbvGrd": totRmsAbvGrd,
    "fireplaces": fireplaces,
    "fireplaceQu": fireplaceQu,
    "garageType": garageType,
    "garageFinish": garageFinish,
    "garageCars": garageCars,
    "garageQual": garageQual,
    "pavedDrive": pavedDrive,
    "poolArea": poolArea,
    "miscVal": miscVal,
    "moSold": moSold,
    "saleType": saleType,
    "saleCondition": saleCondition,
    "salePrice": salePrice,
    "houseage": houseage,
    "houseremodelage": houseremodelage,
    "totalsf": totalsf,
    "totalarea": totalarea,
    "totalbaths": totalbaths,
    "totalporchsf": totalporchsf,
    "alley": alley,
    "avgRating": avgRating,
    "likedUsers": likedUsers == null ? [] : List<dynamic>.from(likedUsers!.map((x) => x)),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "bookedBy": bookedBy == null ? [] : List<dynamic>.from(bookedBy!.map((x) => x)),
  };
}


class ImageElement {
  String? id;
  String? url;

  ImageElement({
    this.id,
    this.url,
  });

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
    id: json["_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "url": url,
  };
}



class Location {
  String? type;
  List<double>? coordinates;
  String? fullAddress;
  String? city;
  String? state;
  String? country;

  Location({
    this.type,
    this.coordinates,
    this.fullAddress,
    this.city,
    this.state,
    this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    fullAddress: json["fullAddress"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "type":type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    "fullAddress": fullAddress,
    "city": city,
    "state": state,
    "country": country,
  };
}


class Review {
  String? id;
  String? residenceId;
  UserId? userId;
  int? rating;
  int? likes;
  int? unLikes;
  List<dynamic>? likedBy;
  List<String>? unLikedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? comment;

  Review({
    this.id,
    this.residenceId,
    this.userId,
    this.rating,
    this.likes,
    this.unLikes,
    this.likedBy,
    this.unLikedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["_id"],
    residenceId: json["residenceId"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    rating: json["rating"],
    likes: json["likes"],
    unLikes: json["unLikes"],
    likedBy: json["likedBy"] == null ? [] : List<dynamic>.from(json["likedBy"]!.map((x) => x)),
    unLikedBy: json["unLikedBy"] == null ? [] : List<String>.from(json["unLikedBy"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "residenceId": residenceId,
    "userId": userId?.toJson(),
    "rating": rating,
    "likes": likes,
    "unLikes": unLikes,
    "likedBy": likedBy == null ? [] : List<dynamic>.from(likedBy!.map((x) => x)),
    "unLikedBy": unLikedBy == null ? [] : List<dynamic>.from(unLikedBy!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "comment": comment,
  };
}

class UserId {
  UserIdImage? image;
  String? id;
  String? username;

  UserId({
    this.image,
    this.id,
    this.username,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    image: json["image"] == null ? null : UserIdImage.fromJson(json["image"]),
    id: json["_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "_id": id,
    "username": username,
  };
}

class UserIdImage {
  String? url;
  String? publicId;

  UserIdImage({
    this.url,
    this.publicId,
  });

  factory UserIdImage.fromJson(Map<String, dynamic> json) => UserIdImage(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}



