import 'dart:convert';

MessagesChatModel messagesChatModelFromJson(String str) => MessagesChatModel.fromJson(json.decode(str));

String messagesChatModelToJson(MessagesChatModel data) => json.encode(data.toJson());

class MessagesChatModel {
  String? status;
  Chat? chat;

  MessagesChatModel({
    this.status,
    this.chat,
  });

  factory MessagesChatModel.fromJson(Map<String, dynamic> json) => MessagesChatModel(
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
  DateTime? createdAt;
  DateTime? updatedAt;

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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "messageContent": messageContent,
    "senderId": senderId,
    "receiverId": receiverId,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}