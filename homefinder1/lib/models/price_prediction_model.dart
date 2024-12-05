// To parse this JSON data, do
//
//     final pricePeridectionModel = pricePeridectionModelFromJson(jsonString);

import 'dart:convert';

PricePeridectionModel pricePeridectionModelFromJson(String str) => PricePeridectionModel.fromJson(json.decode(str));

String pricePeridectionModelToJson(PricePeridectionModel data) => json.encode(data.toJson());

class PricePeridectionModel {
  String? status;
  int? predictedPrice;
  int? residencePrice;
  String? residenceId;

  PricePeridectionModel({
    this.status,
    this.predictedPrice,
    this.residencePrice,
    this.residenceId,
  });

  factory PricePeridectionModel.fromJson(Map<String, dynamic> json) => PricePeridectionModel(
    status: json["status"],
    predictedPrice: json["predicted_price"],
    residencePrice: json["residence_price"],
    residenceId: json["residenceId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "predicted_price": predictedPrice,
    "residence_price": residencePrice,
    "residenceId": residenceId,
  };
}
