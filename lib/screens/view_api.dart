import 'package:flutter/material.dart';

import '../network/feel.dart';

class ViewAPI extends StatelessWidget {
  final Coffee coffee;
  const ViewAPI(this.coffee, {super.key});

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
      ),
      body: Card(
          margin: EdgeInsets.only(
            top: 10,
            bottom: 200,
            right: 8,
            left: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Title(
                  color: Colors.black,
                  child: Text(
                    coffee.headtitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      coffee.image,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(coffee.description),
              )
            ],
          )),
    );
  }
}
