import 'dart:convert';

UpdateResidence welcomeFromJson(String str) => UpdateResidence.fromJson(json.decode(str));

String welcomeToJson(UpdateResidence data) => json.encode(data.toJson());

class UpdateResidence {
  String? status;
  Residence? residence;

  UpdateResidence({
    this.status,
    this.residence,
  });

  factory UpdateResidence.fromJson(Map<String, dynamic> json) => UpdateResidence(
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
  String? title;
  String? type;
  String? category;
  String? ownerId;

  Residence({
    this.id,
    this.title,
    this.type,
    this.category,
    this.ownerId,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    id: json["_id"],
    title: json["title"],
    type: json["type"],
    category: json["category"],
    ownerId: json["ownerId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "type": type,
    "category": category,
    "ownerId": ownerId,
  };
}
