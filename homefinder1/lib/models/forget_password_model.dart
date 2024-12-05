// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ForgetPaaswordModel welcomeFromJson(String str) => ForgetPaaswordModel.fromJson(json.decode(str));

String welcomeToJson(ForgetPaaswordModel data) => json.encode(data.toJson());

class ForgetPaaswordModel {
  String? status;
  String? message;
  String? email;

  ForgetPaaswordModel({
    this.status,
    this.message,
    this.email,
  });

  factory ForgetPaaswordModel.fromJson(Map<String, dynamic> json) => ForgetPaaswordModel(
    status: json["status"],
    message: json["message"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "email": email,
  };
}
