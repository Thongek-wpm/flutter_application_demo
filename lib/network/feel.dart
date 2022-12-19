// To parse this JSON data, do
//
//     final coffee = coffeeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_application_demo/screens/view_api.dart';

List<Coffee> coffeeFromJson(String str) =>
    List<Coffee>.from(json.decode(str).map((x) => Coffee.fromJson(x)));

String coffeeToJson(List<Coffee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coffee {
  Coffee({
    required this.headtitle,
    required this.description,
    required this.image,
    required this.id,
  });

  final String headtitle;
  final String description;
  final String image;
  final int id;

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
        headtitle: json["title"],
        description: json["description"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": headtitle,
        "description": description,
        "image": image,
        "id": id,
      };

}
