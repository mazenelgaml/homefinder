// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String status;
  int count;
  List<Residence> residences;

  Welcome({
    required this.status,
    required this.count,
    required this.residences,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    count: json["count"],
    residences: List<Residence>.from(json["residences"].map((x) => Residence.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "residences": List<dynamic>.from(residences.map((x) => x.toJson())),
  };
}

class Residence {
  String id;
  bool isLiked;
  bool isCompleted;
  bool isSold;
  String title;
  Category category;
  ResidenceType type;
  Status status;
  int salePrice;
  PaymentPeriod paymentPeriod;
  int bedroomAbvGr;
  int totalbaths;
  int totRmsAbvGrd;
  int kitchenAbvGr;
  int totalporchsf;
  int totalarea;
  bool hasGarage;
  bool hasFireplace;
  bool hasBasement;
  CentralAir centralAir;
  Neighborhood neighborhood;
  ResidenceLocation location;
  List<ImageElement> images;
  List<dynamic> reviews;
  OwnerId ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  Residence({
    required this.id,
    required this.isLiked,
    required this.isCompleted,
    required this.isSold,
    required this.title,
    required this.category,
    required this.type,
    required this.status,
    required this.salePrice,
    required this.paymentPeriod,
    required this.bedroomAbvGr,
    required this.totalbaths,
    required this.totRmsAbvGrd,
    required this.kitchenAbvGr,
    required this.totalporchsf,
    required this.totalarea,
    required this.hasGarage,
    required this.hasFireplace,
    required this.hasBasement,
    required this.centralAir,
    required this.neighborhood,
    required this.location,
    required this.images,
    required this.reviews,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    id: json["_id"],
    isLiked: json["isLiked"],
    isCompleted: json["isCompleted"],
    isSold: json["isSold"],
    title: json["title"],
    category: categoryValues.map[json["category"]]!,
    type: residenceTypeValues.map[json["type"]]!,
    status: statusValues.map[json["status"]]!,
    salePrice: json["salePrice"],
    paymentPeriod: paymentPeriodValues.map[json["paymentPeriod"]]!,
    bedroomAbvGr: json["bedroomAbvGr"],
    totalbaths: json["totalbaths"],
    totRmsAbvGrd: json["totRmsAbvGrd"],
    kitchenAbvGr: json["KitchenAbvGr"],
    totalporchsf: json["totalporchsf"],
    totalarea: json["totalarea"],
    hasGarage: json["hasGarage"],
    hasFireplace: json["hasFireplace"],
    hasBasement: json["hasBasement"],
    centralAir: centralAirValues.map[json["centralAir"]]!,
    neighborhood: neighborhoodValues.map[json["neighborhood"]]!,
    location: ResidenceLocation.fromJson(json["location"]),
    images: List<ImageElement>.from(json["images"].map((x) => ImageElement.fromJson(x))),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    ownerId: OwnerId.fromJson(json["ownerId"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isLiked": isLiked,
    "isCompleted": isCompleted,
    "isSold": isSold,
    "title": title,
    "category": categoryValues.reverse[category],
    "type": residenceTypeValues.reverse[type],
    "status": statusValues.reverse[status],
    "salePrice": salePrice,
    "paymentPeriod": paymentPeriodValues.reverse[paymentPeriod],
    "bedroomAbvGr": bedroomAbvGr,
    "totalbaths": totalbaths,
    "totRmsAbvGrd": totRmsAbvGrd,
    "KitchenAbvGr": kitchenAbvGr,
    "totalporchsf": totalporchsf,
    "totalarea": totalarea,
    "hasGarage": hasGarage,
    "hasFireplace": hasFireplace,
    "hasBasement": hasBasement,
    "centralAir": centralAirValues.reverse[centralAir],
    "neighborhood": neighborhoodValues.reverse[neighborhood],
    "location": location.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "ownerId": ownerId.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Category {
  HOUSE,
  VILLA
}

final categoryValues = EnumValues({
  "house": Category.HOUSE,
  "villa": Category.VILLA
});

enum CentralAir {
  YES
}

final centralAirValues = EnumValues({
  "yes": CentralAir.YES
});

class ImageElement {
  String url;
  String publicId;
  String id;

  ImageElement({
    required this.url,
    required this.publicId,
    required this.id,
  });

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
    url: json["url"],
    publicId: json["public_id"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
    "_id": id,
  };
}

class ResidenceLocation {
  LocationType type;
  List<double> coordinates;
  String fullAddress;
  City city;
  State state;
  Country country;

  ResidenceLocation({
    required this.type,
    required this.coordinates,
    required this.fullAddress,
    required this.city,
    required this.state,
    required this.country,
  });

  factory ResidenceLocation.fromJson(Map<String, dynamic> json) => ResidenceLocation(
    type: locationTypeValues.map[json["type"]]!,
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    fullAddress: json["fullAddress"],
    city: cityValues.map[json["city"]]!,
    state: stateValues.map[json["state"]]!,
    country: countryValues.map[json["country"]]!,
  );

  Map<String, dynamic> toJson() => {
    "type": locationTypeValues.reverse[type],
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "fullAddress": fullAddress,
    "city": cityValues.reverse[city],
    "state": stateValues.reverse[state],
    "country": countryValues.reverse[country],
  };
}

enum City {
  AMES
}

final cityValues = EnumValues({
  "Ames": City.AMES
});

enum Country {
  UNITED_STATES
}

final countryValues = EnumValues({
  "United States": Country.UNITED_STATES
});

enum State {
  IOWA
}

final stateValues = EnumValues({
  "Iowa": State.IOWA
});

enum LocationType {
  POINT
}

final locationTypeValues = EnumValues({
  "Point": LocationType.POINT
});

enum Neighborhood {
  COLLEGE_CREEK
}

final neighborhoodValues = EnumValues({
  "college creek": Neighborhood.COLLEGE_CREEK
});

class OwnerId {
  OwnerIdImage image;
  OwnerIdLocation location;
  Id id;
  Username username;

  OwnerId({
    required this.image,
    required this.location,
    required this.id,
    required this.username,
  });

  factory OwnerId.fromJson(Map<String, dynamic> json) => OwnerId(
    image: OwnerIdImage.fromJson(json["image"]),
    location: OwnerIdLocation.fromJson(json["location"]),
    id: idValues.map[json["_id"]]!,
    username: usernameValues.map[json["username"]]!,
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
    "location": location.toJson(),
    "_id": idValues.reverse[id],
    "username": usernameValues.reverse[username],
  };
}

enum Id {
  THE_664_A7_ACEC94_E6_ED55_FEC6_CED
}

final idValues = EnumValues({
  "664a7acec94e6ed55fec6ced": Id.THE_664_A7_ACEC94_E6_ED55_FEC6_CED
});

class OwnerIdImage {
  String url;
  PublicId publicId;

  OwnerIdImage({
    required this.url,
    required this.publicId,
  });

  factory OwnerIdImage.fromJson(Map<String, dynamic> json) => OwnerIdImage(
    url: json["url"],
    publicId: publicIdValues.map[json["public_id"]]!,
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicIdValues.reverse[publicId],
  };
}

enum PublicId {
  AVATAR_DS5_UVWBQOXV5_DAYOIVKE
}

final publicIdValues = EnumValues({
  "avatar/ds5uvwbqoxv5dayoivke": PublicId.AVATAR_DS5_UVWBQOXV5_DAYOIVKE
});

class OwnerIdLocation {
  String fullAddress;

  OwnerIdLocation({
    required this.fullAddress,
  });

  factory OwnerIdLocation.fromJson(Map<String, dynamic> json) => OwnerIdLocation(
    fullAddress: json["fullAddress"],
  );

  Map<String, dynamic> toJson() => {
    "fullAddress": fullAddress,
  };
}

enum Username {
  MOHAMED
}

final usernameValues = EnumValues({
  "mohamed": Username.MOHAMED
});

enum PaymentPeriod {
  YEARLY
}

final paymentPeriodValues = EnumValues({
  "yearly": PaymentPeriod.YEARLY
});

enum Status {
  APPROVED
}

final statusValues = EnumValues({
  "approved": Status.APPROVED
});

enum ResidenceType {
  SALE
}

final residenceTypeValues = EnumValues({
  "sale": ResidenceType.SALE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
