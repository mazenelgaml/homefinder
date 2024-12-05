// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LogOutModel welcomeFromJson(String str) => LogOutModel.fromJson(json.decode(str));

String welcomeToJson(LogOutModel data) => json.encode(data.toJson());

class LogOutModel {
  String? status;

  LogOutModel({
    this.status,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
