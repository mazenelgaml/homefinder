import 'dart:convert';

UserSearchChatModel userChatModelFromJson(String str) => UserSearchChatModel.fromJson(json.decode(str));

String userChatModelToJson(UserSearchChatModel data) => json.encode(data.toJson());

class UserSearchChatModel {
  String? status;
  List<User>? users;

  UserSearchChatModel({
    this.status,
    this.users,
  });

  factory UserSearchChatModel.fromJson(Map<String, dynamic> json) => UserSearchChatModel(
    status: json["status"],
    users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class User {
  ImageUser? imageUser;
  Location? location;
  String? id;
  String? username;
  String? email;
  String? role;
  List<String>? wishlist;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? fullName;
  String? gender;
  String? lastName;
  String? phone;

  User({
    this.imageUser,
    this.location,
    this.id,
    this.username,
    this.email,
    this.role,
    this.wishlist,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.fullName,
    this.gender,
    this.lastName,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    imageUser: json["image"] == null ? null : ImageUser.fromJson(json["image"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    role: json["role"],
    wishlist: json["wishlist"] == null ? [] : List<String>.from(json["wishlist"]!.map((x) => x)),
    isVerified: json["isVerified"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    firstName: json["firstName"],
    fullName: json["fullName"],
    gender: json["gender"],
    lastName: json["lastName"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "image": imageUser?.toJson(),
    "location": location?.toJson(),
    "_id": id,
    "username": username,
    "email": email,
    "role": role,
    "wishlist": wishlist == null ? [] : List<dynamic>.from(wishlist!.map((x) => x)),
    "isVerified": isVerified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "firstName": firstName,
    "fullName": fullName,
    "gender": gender,
    "lastName": lastName,
    "phone": phone,
  };
}

class ImageUser {
  String? url;
  String? publicId;

  ImageUser({
    this.url,
    this.publicId,
  });

  factory ImageUser.fromJson(Map<String, dynamic> json) => ImageUser(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}

class Location {
  double? longitude;
  double? latitude;
  String? fullAddress;
  String? city;
  String? state;
  String? country;

  Location({
    this.longitude,
    this.latitude,
    this.fullAddress,
    this.city,
    this.state,
    this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    fullAddress: json["fullAddress"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
    "fullAddress": fullAddress,
    "city": city,
    "state": state,
    "country": country,
  };
}