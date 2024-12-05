// To parse this JSON data, do
//
//     final likeReviewModel = likeReviewModelFromJson(jsonString);

import 'dart:convert';

LikeReviewModel likeReviewModelFromJson(String str) => LikeReviewModel.fromJson(json.decode(str));

String likeReviewModelToJson(LikeReviewModel data) => json.encode(data.toJson());

class LikeReviewModel {
  String? status;
  String? message;
  String? reviewId;
  int? likes;
  int? unLikes;

  LikeReviewModel({
    this.status,
    this.message,
    this.reviewId,
    this.likes,
    this.unLikes,
  });

  factory LikeReviewModel.fromJson(Map<String, dynamic> json) => LikeReviewModel(
    status: json["status"],
    message: json["message"],
    reviewId: json["reviewId"],
    likes: json["likes"],
    unLikes: json["unLikes"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "reviewId": reviewId,
    "likes": likes,
    "unLikes": unLikes,
  };
}
