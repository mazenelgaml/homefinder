// To parse this JSON data, do
//
//     final getOneResidencesModel = getOneResidencesModelFromJson(jsonString);

import 'dart:convert';

GetOneResidencesModel getOneResidencesModelFromJson(String str) => GetOneResidencesModel.fromJson(json.decode(str));

String getOneResidencesModelToJson(GetOneResidencesModel data) => json.encode(data.toJson());

class GetOneResidencesModel {
  String? status;
  Residence? residence;

  GetOneResidencesModel({
    this.status,
    this.residence,
  });

  factory GetOneResidencesModel.fromJson(Map<String, dynamic> json) => GetOneResidencesModel(
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
  ResidenceLocation? location;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int? salePrice;
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
  String? fireplaceQu;
  int? fireplaces;
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
  int? houseage;
  int? houseremodelage;
  int? totalsf;
  int? totalarea;
  int? totalbaths;
  int? totalporchsf;
  List<ImageElement>? images;
  String? alley;
  int? avgRating;
  List<dynamic>? bookedBy;
  List<dynamic>? likedUsers;
  OwnerId? ownerId;
  List<dynamic>? reviews;

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
    this.salePrice,
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
    this.fireplaceQu,
    this.fireplaces,
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
    this.houseage,
    this.houseremodelage,
    this.totalsf,
    this.totalarea,
    this.totalbaths,
    this.totalporchsf,
    this.images,
    this.alley,
    this.avgRating,
    this.bookedBy,
    this.likedUsers,
    this.ownerId,
    this.reviews,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    isLiked: json["isLiked"],
    location: json["location"] == null ? null : ResidenceLocation.fromJson(json["location"]),
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    salePrice: json["salePrice"],
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
    kitchenQual: json["kitchenQual"],
    totRmsAbvGrd: json["totRmsAbvGrd"],
    fireplaceQu: json["fireplaceQu"],
    fireplaces: json["fireplaces"],
    garageType: json["garageType"],
    garageFinish: json["garageFinish"],
    garageCars: json["garageCars"],
    garageQual: json["garageQual"],
    pavedDrive: json["pavedDrive"],
    poolArea: json["poolArea"],
    miscVal: json["miscVal"],
    moSold: json["moSold"],
    saleType: json["saleType"],
    saleCondition: json["saleCondition"],
    houseage: json["houseage"],
    houseremodelage: json["houseremodelage"],
    totalsf: json["totalsf"],
    totalarea: json["totalarea"],
    totalbaths: json["totalbaths"],
    totalporchsf: json["totalporchsf"],
    images: json["images"] == null ? [] : List<ImageElement>.from(json["images"]!.map((x) => ImageElement.fromJson(x))),
    alley: json["alley"],
    avgRating: json["avgRating"],
    bookedBy: json["bookedBy"] == null ? [] : List<dynamic>.from(json["bookedBy"]!.map((x) => x)),
    likedUsers: json["likedUsers"] == null ? [] : List<dynamic>.from(json["likedUsers"]!.map((x) => x)),
    ownerId: json["ownerId"] == null ? null : OwnerId.fromJson(json["ownerId"]),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
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
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "salePrice": salePrice,
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
    "fireplaceQu": fireplaceQu,
    "fireplaces": fireplaces,
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
    "houseage": houseage,
    "houseremodelage": houseremodelage,
    "totalsf": totalsf,
    "totalarea": totalarea,
    "totalbaths": totalbaths,
    "totalporchsf": totalporchsf,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "alley": alley,
    "avgRating": avgRating,
    "bookedBy": bookedBy == null ? [] : List<dynamic>.from(bookedBy!.map((x) => x)),
    "likedUsers": likedUsers == null ? [] : List<dynamic>.from(likedUsers!.map((x) => x)),
    "ownerId": ownerId?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
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

class ResidenceLocation {
  String? type;
  List<double>? coordinates;
  String? fullAddress;
  String? city;
  String? state;
  String? country;

  ResidenceLocation({
    this.type,
    this.coordinates,
    this.fullAddress,
    this.city,
    this.state,
    this.country,
  });

  factory ResidenceLocation.fromJson(Map<String, dynamic> json) => ResidenceLocation(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    fullAddress: json["fullAddress"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    "fullAddress": fullAddress,
    "city": city,
    "state": state,
    "country": country,
  };
}

class OwnerId {
  OwnerIdImage? image;
  OwnerIdLocation? location;
  String? id;
  String? username;

  OwnerId({
    this.image,
    this.location,
    this.id,
    this.username,
  });

  factory OwnerId.fromJson(Map<String, dynamic> json) => OwnerId(
    image: json["image"] == null ? null : OwnerIdImage.fromJson(json["image"]),
    location: json["location"] == null ? null : OwnerIdLocation.fromJson(json["location"]),
    id: json["_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "location": location?.toJson(),
    "_id": id,
    "username": username,
  };
}

class OwnerIdImage {
  String? url;
  String? publicId;

  OwnerIdImage({
    this.url,
    this.publicId,
  });

  factory OwnerIdImage.fromJson(Map<String, dynamic> json) => OwnerIdImage(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}

class OwnerIdLocation {
  String? fullAddress;

  OwnerIdLocation({
    this.fullAddress,
  });

  factory OwnerIdLocation.fromJson(Map<String, dynamic> json) => OwnerIdLocation(
    fullAddress: json["fullAddress"],
  );

  Map<String, dynamic> toJson() => {
    "fullAddress": fullAddress,
  };
}
