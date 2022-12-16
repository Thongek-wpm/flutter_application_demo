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
    required this.title,
    required this.description,
    required this.image,
    required this.id,
  });

  final String title;
  final String description;
  final String image;
  final int id;

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
        "id": id,
      };
  late List<Map<String, dynamic>> _coffee = [];
  void _coffeeFeed(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _coffee;
    } else {
      results = _coffee
          .where((_coffeeFeed) => _coffeeFeed['coffee']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }
}
