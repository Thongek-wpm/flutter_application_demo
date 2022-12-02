// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_demo/model/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterUi extends StatefulWidget {
  const RegisterUi({super.key});

  @override
  State<RegisterUi> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Profile profile = Profile(
      email: '',
      password: '',
      fullName: '',
      phone: '',
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'REGISTER ACCOUNT',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Name and Lastname',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    validator: RequiredValidator(errorText: 'you enter name'),
                    onSaved: (String? fullname) {
                      profile.fullName = fullname!;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Icon(FontAwesomeIcons.person),
                      hintText: 'Enter Fullname',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                          errorText: 'you enter your E-mail',
                        ),
                        EmailValidator(
                          errorText: 'Your email format is invalid.',
                        )
                      ],
                    ),
                    onSaved: (String? email) {
                      profile.email = email!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Icon(Icons.email),
                      hintText: 'Enter E-mail',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    validator:
                        RequiredValidator(errorText: 'you enter password'),
                    onSaved: (String? password) {
                      profile.password = password!;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Icon(FontAwesomeIcons.key),
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Number Phone',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    validator:
                        RequiredValidator(errorText: 'you enter number phone'),
                    onSaved: (String? phone) {
                      profile.phone = phone!;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Icon(FontAwesomeIcons.phone),
                      hintText: 'Enter NumberPhone',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Register'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
