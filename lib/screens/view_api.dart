import 'package:flutter/material.dart';
import 'package:flutter_application_demo/model/api.dart';
import 'package:flutter_application_demo/model/feel.dart';

class ViewAPI extends StatefulWidget {
  const ViewAPI({super.key});

  @override
  State<ViewAPI> createState() => _ViewAPIState();
}

class _ViewAPIState extends State<ViewAPI> {
  // ignore: prefer_typing_uninitialized_variables

  late Coffee coffee;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    WebApiService().feed();
    super.initState();
  }
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
    );
  }
}
