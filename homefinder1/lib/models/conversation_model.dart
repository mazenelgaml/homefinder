// To parse this JSON data, do
//
//     final conversationModel = conversationModelFromJson(jsonString);

import 'dart:convert';

ConversationModel conversationModelFromJson(String str) => ConversationModel.fromJson(json.decode(str));

String conversationModelToJson(ConversationModel data) => json.encode(data.toJson());

class ConversationModel {
  String? status;
  Chat? chat;

  ConversationModel({
    this.status,
    this.chat,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
    status: json["status"],
    chat: json["chat"] == null ? null : Chat.fromJson(json["chat"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "chat": chat?.toJson(),
  };
}

class Chat {
  String? id;
  List<Message>? messages;

  Chat({
    this.id,
    this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["_id"],
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  String? id;
  String? messageContent;
  String? senderId;
  String? receiverId;
  List<dynamic>? media;
  String? createdAt;
  String? updatedAt;

  Message({
    this.id,
    this.messageContent,
    this.senderId,
    this.receiverId,
    this.media,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    messageContent: json["messageContent"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
    createdAt: json["createdAt"] ,
    updatedAt: json["updatedAt"] ,
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
