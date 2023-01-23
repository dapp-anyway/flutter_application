// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

import 'package:chuck_norris_application/services/string_extension.dart';

List<String> categoriesFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categoriesToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

