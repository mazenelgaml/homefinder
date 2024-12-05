// To parse this JSON data, do
//
//     final getSoldForProfileModel = getSoldForProfileModelFromJson(jsonString);

import 'dart:convert';

GetSoldForProfileModel getSoldForProfileModelFromJson(String str) => GetSoldForProfileModel.fromJson(json.decode(str));

String getSoldForProfileModelToJson(GetSoldForProfileModel data) => json.encode(data.toJson());

class GetSoldForProfileModel {
  String? status;
  int? count;
  List<dynamic>? residences;

  GetSoldForProfileModel({
    this.status,
    this.count,
    this.residences,
  });

  factory GetSoldForProfileModel.fromJson(Map<String, dynamic> json) => GetSoldForProfileModel(
    status: json["status"],
    count: json["count"],
    residences: json["residences"] == null ? [] : List<dynamic>.from(json["residences"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "residences": residences == null ? [] : List<dynamic>.from(residences!.map((x) => x)),
  };
}
