// To parse this JSON data, do
//
//     final catFact = catFactFromJson(jsonString);
import 'dart:convert';

import 'package:cat_trivia/data/constants.dart';
import 'package:cat_trivia/domain/entities/cat_fact.dart';

CatFactModel catFactFromJson(String str) => CatFactModel.fromJson(json.decode(str));

String catFactToJson(CatFactModel data) => json.encode(data.toJson());

class CatFactModel {
  CatFactModel({
    required this.status,
    required this.id,
    required this.user,
    required this.text,
    required this.v,
    required this.source,
    required this.updatedAt,
    required this.type,
    required this.createdAt,
    required this.deleted,
    required this.used,
  });

  final Status status;
  final String id;
  final String user;
  final String text;
  final int v;
  final String source;
  final DateTime updatedAt;
  final String type;
  final DateTime createdAt;
  final bool deleted;
  final bool used;

  factory CatFactModel.fromJson(Map<String, dynamic> json) => CatFactModel(
    status: Status.fromJson(json["status"]),
    id: json["_id"],
    user: json["user"],
    text: json["text"],
    v: json["__v"],
    source: json["source"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    deleted: json["deleted"],
    used: json["used"],
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "_id": id,
    "user": user,
    "text": text,
    "__v": v,
    "source": source,
    "updatedAt": updatedAt.toIso8601String(),
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "deleted": deleted,
    "used": used,
  };

  CatFact toEntity() => CatFact(
    image: Urls.randomCatImageUrl,
    text: text,
    createdAt: createdAt,
  );
}

class Status {
  Status({
    required this.verified,
    required this.sentCount,
  });

  final bool verified;
  final int sentCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    verified: json["verified"],
    sentCount: json["sentCount"],
  );

  Map<String, dynamic> toJson() => {
    "verified": verified,
    "sentCount": sentCount,
  };
}