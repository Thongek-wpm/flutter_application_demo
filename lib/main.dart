import 'package:flutter/material.dart';
import 'package:flutter_application_demo/screens/Register_ui.dart';
import 'package:flutter_application_demo/screens/login_ui.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DOMII',
      ),
      home: const RegisterUi(),
    ),
  );
}
