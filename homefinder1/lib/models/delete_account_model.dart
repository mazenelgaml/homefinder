// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeleteAccountModel welcomeFromJson(String str) => DeleteAccountModel.fromJson(json.decode(str));

String welcomeToJson(DeleteAccountModel data) => json.encode(data.toJson());

class DeleteAccountModel {
  String? status;
  String? message;

  DeleteAccountModel({
    this.status,
    this.message,
  });

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) => DeleteAccountModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
