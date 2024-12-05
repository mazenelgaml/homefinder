// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

FirstCompleteModel welcomeFromJson(String str) => FirstCompleteModel.fromJson(json.decode(str));

String welcomeToJson(FirstCompleteModel data) => json.encode(data.toJson());

class FirstCompleteModel {
  String? status;
  Residence? residence;

  FirstCompleteModel({
    this.status,
    this.residence,
  });

  factory FirstCompleteModel.fromJson(Map<String, dynamic> json) => FirstCompleteModel(
    status: json["status"],
    residence: json["residence"] == null ? null : Residence.fromJson(json["residence"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "residence": residence?.toJson(),
  };
}

class Residence {
  String? id;
  String? neighborhood;
  String? mszoning;
  String? saleCondition;
  int? moSold;
  int? salePrice;
  String? paymentPeriod;
  String? saleType;
  String? utilities;
  String? lotShape;
  String? foundation;
  String? electrical;
  String? bldgType;
  String? ownerId;

  Residence({
    this.id,
    this.neighborhood,
    this.mszoning,
    this.saleCondition,
    this.moSold,
    this.salePrice,
    this.paymentPeriod,
    this.saleType,
    this.utilities,
    this.lotShape,
    this.foundation,
    this.electrical,
    this.bldgType,
    this.ownerId,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    id: json["_id"],
    neighborhood: json["neighborhood"],
    mszoning: json["mszoning"],
    saleCondition: json["saleCondition"],
    moSold: json["moSold"],
    salePrice: json["salePrice"],
    paymentPeriod: json["paymentPeriod"],
    saleType: json["saleType"],
    utilities: json["utilities"],
    lotShape: json["lotShape"],
    foundation: json["foundation"],
    electrical:json["electrical"],
    bldgType: json["bldgType"],
    ownerId: json["ownerId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "neighborhood": neighborhood,
    "mszoning": mszoning,
    "saleCondition": saleCondition,
    "moSold": moSold,
    "salePrice": salePrice,
    "paymentPeriod": paymentPeriod,
    "saleType": saleType,
    "utilities": utilities,
    "lotShape": lotShape,
    "foundation": foundation,
    "electrical":electrical,
    "bldgType": bldgType,
    "ownerId": ownerId,
  };
}
