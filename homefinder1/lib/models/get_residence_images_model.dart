import 'dart:convert';

GetResidencesImagesModel getResidencesImagesModelFromJson(String str) => GetResidencesImagesModel.fromJson(json.decode(str));

String getResidencesImagesModelToJson(GetResidencesImagesModel data) => json.encode(data.toJson());

class GetResidencesImagesModel {
  String? status;
  String? residenceId;
  List<Image>? images;

  GetResidencesImagesModel({
    this.status,
    this.residenceId,
    this.images,
  });

  factory GetResidencesImagesModel.fromJson(Map<String, dynamic> json) => GetResidencesImagesModel(
    status: json["status"],
    residenceId: json["residenceId"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "residenceId": residenceId,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  String? id;
  String? url;

  Image({
    this.id,
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "url": url,
  };
}