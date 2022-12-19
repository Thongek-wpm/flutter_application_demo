import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_demo/model/network/feel.dart';

class WebApiService {
  Future<List<Coffee>> feed() async {
    final dio = Dio();
    final result = await dio.get("https://api.sampleapis.com/coffee/hot");
    final coffee = coffeeFromJson(jsonEncode(result.data));
    return coffee;
  }
}
