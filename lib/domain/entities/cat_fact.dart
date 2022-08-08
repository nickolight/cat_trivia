// To parse this JSON data, do
//
//     final catFact = catFactFromJson(jsonString);
import 'dart:convert';

CatFact catFactFromJson(String str) => CatFact.fromJson(json.decode(str));

String catFactToJson(CatFact data) => json.encode(data.toJson());

class CatFact {
  CatFact({
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

  factory CatFact.fromJson(Map<String, dynamic> json) => CatFact(
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
