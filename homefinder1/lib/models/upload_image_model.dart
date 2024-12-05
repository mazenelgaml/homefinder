// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UploadImageModel welcomeFromJson(String str) => UploadImageModel.fromJson(json.decode(str));

String welcomeToJson(UploadImageModel data) => json.encode(data.toJson());

class UploadImageModel {
  String? status;
  Image? image;

  UploadImageModel({
    this.status,
    this.image,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) => UploadImageModel(
    status: json["status"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
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
