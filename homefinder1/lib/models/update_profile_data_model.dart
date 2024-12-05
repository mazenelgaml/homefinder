// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpdateProfileDataModel welcomeFromJson(String str) => UpdateProfileDataModel.fromJson(json.decode(str));

String welcomeToJson(UpdateProfileDataModel data) => json.encode(data.toJson());

class UpdateProfileDataModel {
  String? status;
  User? user;
  String? message;

  UpdateProfileDataModel({
    this.status,
    this.user,
    this.message,
  });

  factory UpdateProfileDataModel.fromJson(Map<String, dynamic> json) => UpdateProfileDataModel(
    status: json["status"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user?.toJson(),
    "message": message,
  };
}

class User {
  Image? image;
  String? id;
  String? username;
  String? email;
  String? role;
  List<dynamic>? wishlist;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? gender;
  String? lastName;
  String? phone;
  String? fullName;

  User({
    this.image,
    this.id,
    this.username,
    this.email,
    this.role,
    this.wishlist,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.gender,
    this.lastName,
    this.phone,
    this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    role: json["role"],
    wishlist: json["wishlist"] == null ? [] : List<dynamic>.from(json["wishlist"]!.map((x) => x)),
    isVerified: json["isVerified"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    firstName: json["firstName"],
    gender: json["gender"],
    lastName: json["lastName"],
    phone: json["phone"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "_id": id,
    "username": username,
    "email": email,
    "role": role,
    "wishlist": wishlist == null ? [] : List<dynamic>.from(wishlist!.map((x) => x)),
    "isVerified": isVerified,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "firstName": firstName,
    "gender": gender,
    "lastName": lastName,
    "phone": phone,
    "fullName": fullName,
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
