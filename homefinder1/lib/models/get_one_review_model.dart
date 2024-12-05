// To parse this JSON data, do
//
//     final getOneReviewModel = getOneReviewModelFromJson(jsonString);

import 'dart:convert';

GetOneReviewModel getOneReviewModelFromJson(String str) => GetOneReviewModel.fromJson(json.decode(str));

String getOneReviewModelToJson(GetOneReviewModel data) => json.encode(data.toJson());

class GetOneReviewModel {
  String? status;
  Review? review;

  GetOneReviewModel({
    this.status,
    this.review,
  });

  factory GetOneReviewModel.fromJson(Map<String, dynamic> json) => GetOneReviewModel(
    status: json["status"],
    review: json["review"] == null ? null : Review.fromJson(json["review"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "review": review?.toJson(),
  };
}

class Review {
  String? id;
  ResidenceId? residenceId;
  UserId? userId;
  int? rating;
  int? likes;
  int? unLikes;
  List<dynamic>? likedBy;
  List<dynamic>? unLikedBy;
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
    residenceId: json["residenceId"] == null ? null : ResidenceId.fromJson(json["residenceId"]),
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    rating: json["rating"],
    likes: json["likes"],
    unLikes: json["unLikes"],
    likedBy: json["likedBy"] == null ? [] : List<dynamic>.from(json["likedBy"]!.map((x) => x)),
    unLikedBy: json["unLikedBy"] == null ? [] : List<dynamic>.from(json["unLikedBy"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "residenceId": residenceId?.toJson(),
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

class ResidenceId {
  bool? isLiked;
  Location? location;
  String? id;
  String? title;
  String? category;
  String? paymentPeriod;
  List<ImageElement>? images;
  int? salePrice;
  int? avgRating;

  ResidenceId({
    this.isLiked,
    this.location,
    this.id,
    this.title,
    this.category,
    this.paymentPeriod,
    this.images,
    this.salePrice,
    this.avgRating,
  });

  factory ResidenceId.fromJson(Map<String, dynamic> json) => ResidenceId(
    isLiked: json["isLiked"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    id: json["_id"],
    title: json["title"],
    category: json["category"],
    paymentPeriod: json["paymentPeriod"],
    images: json["images"] == null ? [] : List<ImageElement>.from(json["images"]!.map((x) => ImageElement.fromJson(x))),
    salePrice: json["salePrice"],
    avgRating: json["avgRating"],
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked,
    "location": location?.toJson(),
    "_id": id,
    "title": title,
    "category": category,
    "paymentPeriod": paymentPeriod,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "salePrice": salePrice,
    "avgRating": avgRating,
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
  String? fullAddress;

  Location({
    this.fullAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    fullAddress: json["fullAddress"],
  );

  Map<String, dynamic> toJson() => {
    "fullAddress": fullAddress,
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
