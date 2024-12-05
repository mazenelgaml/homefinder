// To parse this JSON data, do
//
//     final sendMessageResponseModel = sendMessageResponseModelFromJson(jsonString);

import 'dart:convert';

SendMessageResponseModel sendMessageResponseModelFromJson(String str) => SendMessageResponseModel.fromJson(json.decode(str));

String sendMessageResponseModelToJson(SendMessageResponseModel data) => json.encode(data.toJson());

class SendMessageResponseModel {
  String? status;
  Message? message;

  SendMessageResponseModel({
    this.status,
    this.message,
  });

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) => SendMessageResponseModel(
    status: json["status"],
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message?.toJson(),
  };
}

class Message {
  String? messageContent;
  String? senderId;
  String? receiverId;
  String? id;
  List<dynamic>? media;
  DateTime? createdAt;
  DateTime? updatedAt;

  Message({
    this.messageContent,
    this.senderId,
    this.receiverId,
    this.id,
    this.media,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    messageContent: json["messageContent"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    id: json["_id"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "messageContent": messageContent,
    "senderId": senderId,
    "receiverId": receiverId,
    "_id": id,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
