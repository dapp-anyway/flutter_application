// To parse this JSON data, do
//
// final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    required this.value,
  });

  List<dynamic>? categories;
  DateTime? createdAt;
  String? iconUrl;
  String? id;
  DateTime? updatedAt;
  String? url;
  String value;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
    iconUrl: json["icon_url"],
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "icon_url": iconUrl,
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "url": url,
    "value": value,
  };
}
