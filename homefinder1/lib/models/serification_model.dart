

import 'dart:convert';

VerificationModel welcomeFromJson(String str) => VerificationModel.fromJson(json.decode(str));

String welcomeToJson(VerificationModel data) => json.encode(data.toJson());

class VerificationModel {
  String? status;
  String? message;

  VerificationModel({
    this.status,
    this.message,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) => VerificationModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
