import 'package:flutter/material.dart';

class Conroller {
  final TextEditingController email = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: '');
  final TextEditingController fullName = TextEditingController(text: '');
  final TextEditingController phone = TextEditingController(text: '');
  final emailReexprssion =
      RegExp('[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}');

}
