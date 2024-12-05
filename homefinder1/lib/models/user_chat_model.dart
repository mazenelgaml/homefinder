// To parse this JSON data, do
//
//     final userChatModel = userChatModelFromJson(jsonString);

import 'dart:convert';

UserChatModel userChatModelFromJson(String str) => UserChatModel.fromJson(json.decode(str));

String userChatModelToJson(UserChatModel data) => json.encode(data.toJson());

class UserChatModel {
  String? status;
  List<ChatUser>? chatUsers;

  UserChatModel({
    this.status,
    this.chatUsers,
  });

  factory UserChatModel.fromJson(Map<String, dynamic> json) => UserChatModel(
    status: json["status"],
    chatUsers: json["chatUsers"] == null ? [] : List<ChatUser>.from(json["chatUsers"]!.map((x) => ChatUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "chatUsers": chatUsers == null ? [] : List<dynamic>.from(chatUsers!.map((x) => x.toJson())),
  };
}

class ChatUser {
  ImageUser? image;
  String? id;
  String? username;
  String? fullName;
  LastMessage? lastMessage;

  ChatUser({
    this.image,
    this.id,
    this.username,
    this.fullName,
    this.lastMessage,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
    image: json["image"] == null ? null : ImageUser.fromJson(json["image"]),
    id: json["_id"],
    username: json["username"],
    fullName: json["fullName"],
    lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "_id": id,
    "username": username,
    "fullName": fullName,
    "lastMessage": lastMessage?.toJson(),
  };
}

class ImageUser {
  String? url;
  String? publicId;

  ImageUser({
    this.url,
    this.publicId,
  });

  factory ImageUser.fromJson(Map<String, dynamic> json) => ImageUser(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}

class LastMessage {
  String? id;
  String? messageContent;
  String? senderId;
  String? receiverId;
  List<dynamic>? media;
  String? createdAt;
  String? updatedAt;

  LastMessage({
    this.id,
    this.messageContent,
    this.senderId,
    this.receiverId,
    this.media,
    this.createdAt,
    this.updatedAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
    id: json["_id"],
    messageContent: json["messageContent"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
    createdAt: json["createdAt"] ,
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "messageContent": messageContent,
    "senderId": senderId,
    "receiverId": receiverId,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
