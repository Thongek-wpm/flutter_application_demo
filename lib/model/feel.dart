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
  Map<String, dynamic> coffee() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = headtitle;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
