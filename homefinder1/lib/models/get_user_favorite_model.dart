
import 'dart:convert';

GetUserFavoriteModel getUserFavoriteModelFromJson(String str) => GetUserFavoriteModel.fromJson(json.decode(str));

String getUserFavoriteModelToJson(GetUserFavoriteModel data) => json.encode(data.toJson());

class GetUserFavoriteModel {
  String? status;
  int? count;
  List<Wishlist>? wishlist;

  GetUserFavoriteModel({
    this.status,
    this.count,
    this.wishlist,
  });

  factory GetUserFavoriteModel.fromJson(Map<String, dynamic> json) => GetUserFavoriteModel(
    status: json["status"],
    count: json["count"],
    wishlist: json["wishlist"] == null ? [] : List<Wishlist>.from(json["wishlist"]!.map((x) => Wishlist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "wishlist": wishlist == null ? [] : List<dynamic>.from(wishlist!.map((x) => x.toJson())),
  };
}

class Wishlist {
  String? id;
  bool? isLiked;
  String? title;
  String? category;
  double? salePrice;
  String? paymentPeriod;
  String? location;
  int? rating;
  List<Image>? images;

  Wishlist({
    this.id,
    this.isLiked,
    this.title,
    this.category,
    this.salePrice,
    this.paymentPeriod,
    this.location,
    this.rating,
    this.images,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    id: json["_id"],
    isLiked: json["isLiked"],
    title: json["title"],
    category: json["category"],
    salePrice: json["salePrice"]?.toDouble(),
    paymentPeriod: json["paymentPeriod"],
    location: json["location"],
    rating: json["rating"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isLiked": isLiked,
    "title": title,
    "category": category,
    "salePrice": salePrice,
    "paymentPeriod": paymentPeriod,
    "location": location,
    "rating": rating,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  String? url;

  Image({
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
