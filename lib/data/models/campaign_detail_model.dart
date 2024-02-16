// To parse this JSON data, do
//
//     final campaignDetailModel = campaignDetailModelFromJson(jsonString);

import 'dart:convert';

List<CampaignDetailModel> campaignDetailModelFromJson(String str) =>
    List<CampaignDetailModel>.from(
        json.decode(str).map((x) => CampaignDetailModel.fromJson(x)));

String campaignDetailModelToJson(List<CampaignDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CampaignDetailModel {
  int? id;
  String? imageUrl;
  String? title;
  String? subtitle;
  int? currentGoal;
  int? totalGoal;
  DateTime? createdAt;
  DateTime? updatedAt;

  CampaignDetailModel({
    this.id,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.currentGoal,
    this.totalGoal,
    this.createdAt,
    this.updatedAt,
  });

  factory CampaignDetailModel.fromJson(Map<String, dynamic> json) =>
      CampaignDetailModel(
        id: json["id"],
        imageUrl: json["image_url"],
        title: json["title"],
        subtitle: json["subtitle"],
        currentGoal: json["current_goal"],
        totalGoal: json["total_goal"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "title": title,
        "subtitle": subtitle,
        "current_goal": currentGoal,
        "total_goal": totalGoal,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
