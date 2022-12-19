import 'package:flutter/material.dart';

import '../network/feel.dart';

class ViewAPI extends StatelessWidget {
  final Coffee coffee;

  ViewAPI(this.coffee); // ig

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(coffee.headtitle),
        centerTitle: true,
      ),
    );
  }
}
