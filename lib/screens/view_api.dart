import 'package:flutter/material.dart';
import 'package:flutter_application_demo/model/network/feel.dart';

class ViewAPI extends StatelessWidget {
  final Coffee coffee;

  ViewAPI(this.coffee); // ig

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(coffee.headtitle),
      ),
    );
  }
}
