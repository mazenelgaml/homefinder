// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

FourthEditModel welcomeFromJson(String str) => FourthEditModel.fromJson(json.decode(str));

String welcomeToJson(FourthEditModel data) => json.encode(data.toJson());

class FourthEditModel {
  String? status;
  Residence? residence;

  FourthEditModel({
    this.status,
    this.residence,
  });

  factory FourthEditModel.fromJson(Map<String, dynamic> json) => FourthEditModel(
    status: json["status"],
    residence: json["residence"] == null ? null : Residence.fromJson(json["residence"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "residence": residence?.toJson(),
  };
}

class Residence {
  bool? isLiked;
  Location? location;
  String? id;
  OwnerId? ownerId;
  bool? isSold;
  bool? isCompleted;
  String? status;
  String? title;
  String? type;
  String? category;
  bool? hasGarage;
  bool? hasFireplace;
  bool? hasBasement;
  List<dynamic>? reviews;
  List<dynamic>? likedUsers;
  String? alley;
  int? poolArea;
  int? garageCars;
  String? garageFinish;
  String? garageType;
  String? garageQual;
  int? fireplaces;
  String? fireplaceQu;
  String? bsmtExposure;
  int? bsmtUnfSf;
  String? masVnrType;
  int? masVnrArea;
  int? totalporchsf;
  int? lotFrontage;
  int? lotArea;
  int? lowQualFinSf;
  int? miscVal;
  int? totalsf;
  int? totalarea;
  int? totalbaths;
  int? houseage;
  int? houseremodelage;
  List<dynamic>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? landContour;
  String? landSlope;
  String? lotConfig;
  int? overallCond;
  int? overallQual;
  String? pavedDrive;

  Residence({
    this.isLiked,
    this.location,
    this.id,
    this.ownerId,
    this.isSold,
    this.isCompleted,
    this.status,
    this.title,
    this.type,
    this.category,
    this.hasGarage,
    this.hasFireplace,
    this.hasBasement,
    this.reviews,
    this.likedUsers,
    this.alley,
    this.poolArea,
    this.garageCars,
    this.garageFinish,
    this.garageType,
    this.garageQual,
    this.fireplaces,
    this.fireplaceQu,
    this.bsmtExposure,
    this.bsmtUnfSf,
    this.masVnrType,
    this.masVnrArea,
    this.totalporchsf,
    this.lotFrontage,
    this.lotArea,
    this.lowQualFinSf,
    this.miscVal,
    this.totalsf,
    this.totalarea,
    this.totalbaths,
    this.houseage,
    this.houseremodelage,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.landContour,
    this.landSlope,
    this.lotConfig,
    this.overallCond,
    this.overallQual,
    this.pavedDrive,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    isLiked: json["isLiked"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    id: json["_id"],
    ownerId: json["ownerId"] == null ? null : OwnerId.fromJson(json["ownerId"]),
    isSold: json["isSold"],
    isCompleted: json["isCompleted"],
    status: json["status"],
    title: json["title"],
    type: json["type"],
    category: json["category"],
    hasGarage: json["hasGarage"],
    hasFireplace: json["hasFireplace"],
    hasBasement: json["hasBasement"],
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    likedUsers: json["likedUsers"] == null ? [] : List<dynamic>.from(json["likedUsers"]!.map((x) => x)),
    alley: json["alley"],
    poolArea: json["poolArea"],
    garageCars: json["garageCars"],
    garageFinish: json["garageFinish"],
    garageType: json["garageType"],
    garageQual: json["garageQual"],
    fireplaces: json["fireplaces"],
    fireplaceQu: json["fireplaceQu"],
    bsmtExposure: json["bsmtExposure"],
    bsmtUnfSf: json["bsmtUnfSF"],
    masVnrType: json["masVnrType"],
    masVnrArea: json["masVnrArea"],
    totalporchsf: json["totalporchsf"],
    lotFrontage: json["lotFrontage"],
    lotArea: json["lotArea"],
    lowQualFinSf: json["lowQualFinSF"],
    miscVal: json["miscVal"],
    totalsf: json["totalsf"],
    totalarea: json["totalarea"],
    totalbaths: json["totalbaths"],
    houseage: json["houseage"],
    houseremodelage: json["houseremodelage"],
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    landContour: json["landContour"],
    landSlope: json["landSlope"],
    lotConfig: json["lotConfig"],
    overallCond: json["overallCond"],
    overallQual: json["overallQual"],
    pavedDrive: json["pavedDrive"],
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked,
    "location": location?.toJson(),
    "_id": id,
    "ownerId": ownerId?.toJson(),
    "isSold": isSold,
    "isCompleted": isCompleted,
    "status": status,
    "title": title,
    "type": type,
    "category": category,
    "hasGarage": hasGarage,
    "hasFireplace": hasFireplace,
    "hasBasement": hasBasement,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "likedUsers": likedUsers == null ? [] : List<dynamic>.from(likedUsers!.map((x) => x)),
    "alley": alley,
    "poolArea": poolArea,
    "garageCars": garageCars,
    "garageFinish": garageFinish,
    "garageType": garageType,
    "garageQual": garageQual,
    "fireplaces": fireplaces,
    "fireplaceQu": fireplaceQu,
    "bsmtExposure": bsmtExposure,
    "bsmtUnfSF": bsmtUnfSf,
    "masVnrType": masVnrType,
    "masVnrArea": masVnrArea,
    "totalporchsf": totalporchsf,
    "lotFrontage": lotFrontage,
    "lotArea": lotArea,
    "lowQualFinSF": lowQualFinSf,
    "miscVal": miscVal,
    "totalsf": totalsf,
    "totalarea": totalarea,
    "totalbaths": totalbaths,
    "houseage": houseage,
    "houseremodelage": houseremodelage,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "landContour": landContour,
    "landSlope": landSlope,
    "lotConfig": lotConfig,
    "overallCond": overallCond,
    "overallQual": overallQual,
    "pavedDrive": pavedDrive,
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class OwnerId {
  Image? image;
  String? id;
  String? username;

  OwnerId({
    this.image,
    this.id,
    this.username,
  });

  factory OwnerId.fromJson(Map<String, dynamic> json) => OwnerId(
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    id: json["_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "_id": id,
    "username": username,
  };
}

class Image {
  String? url;
  String? publicId;

  Image({
    this.url,
    this.publicId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}
