// To parse this JSON data, do
//
//     final coffee = coffeeFromJson(jsonString);

import 'dart:convert';

List<Coffee> coffeeFromJson(String str) =>
    List<Coffee>.from(json.decode(str).map((x) => Coffee.fromJson(x)));

String coffeeToJson(List<Coffee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coffee {
  Coffee({
    required this.headtitle,
    required this.description,
    required this.image,
  });

  final String headtitle;
  final String description;
  final String image;

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
        headtitle: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": headtitle,
        "description": description,
        "image": image,
      };
}
