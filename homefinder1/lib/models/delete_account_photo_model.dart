// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeleteAccountPhotoModel welcomeFromJson(String str) => DeleteAccountPhotoModel.fromJson(json.decode(str));

String welcomeToJson(DeleteAccountPhotoModel data) => json.encode(data.toJson());

class DeleteAccountPhotoModel {
  String? status;
  String? message;
  Image? image;

  DeleteAccountPhotoModel({
    this.status,
    this.message,
    this.image,
  });

  factory DeleteAccountPhotoModel.fromJson(Map<String, dynamic> json) => DeleteAccountPhotoModel(
    status: json["status"],
    message: json["message"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "image": image?.toJson(),
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
