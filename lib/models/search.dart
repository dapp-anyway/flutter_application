// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    required this.total,
    required this.result,
  });

  int total;
  List<Result> result;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        total: json["total"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    required this.value,
  });

  List<String>? categories;
  DateTime? createdAt;
  String? iconUrl;
  String? id;
  DateTime? updatedAt;
  String? url;
  String value;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        categories: List<String>.from(json["categories"].map((x) => x)),
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
        // DateFormat('yyyy-MM-dd hh:mm:ss').format(createdAt!),
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "url": url,
        "value": value,
      };
}
