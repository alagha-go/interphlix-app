// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.type,
  });

  String id;
  String type;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
      };
}
