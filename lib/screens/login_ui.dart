// ignore_for_file: await_only_futures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/model/profile.dart';
import 'package:flutter_application_demo/screens/home_ui.dart';
import 'package:flutter_application_demo/screens/register_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
    email: '',
    password: '',
    fullName: '',
    phone: '',
  );
  Future saveLoginTypeToSP(String profile) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var collection = FirebaseFirestore.instance.collection('profiles');
    var querySnapshot = await collection.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      var email = data['email']; // <-- Retrieving the value.
      if (email == email) {
        String docId = doc.id;
        sp.setString('userId', docId);
        sp.setString('email', email);
        sp.setString('fullName', data['fullName']);
        sp.setString('phone', data['phone']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Image.asset(
                          'assets/image/coffee-icon.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'LOGIN ACCOUNT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: 0.0,
                      ),
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
                        padding: const EdgeInsets.symmetric(
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
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Icon(Icons.email),
                            hintText: 'Enter E-mail',
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: 0.0,
                      ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                        child: TextFormField(
                          validator: RequiredValidator(
                              errorText: 'you enter password'),
                          onSaved: (String? password) {
                            profile.password = password!;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Icon(Icons.key),
                            hintText: 'Enter Password',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 0.1,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                              }
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: profile.email,
                                  password: profile.password,
                                )
                                    .then((value) {
                                  Fluttertoast.showToast(
                                    msg: "Welcome to Demo App ",
                                    gravity: ToastGravity.CENTER,
                                  );
                                  formKey.currentState!.reset();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomeUi();
                                      },
                                    ),
                                  );
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                  msg: e.message!,
                                  gravity: ToastGravity.CENTER,
                                );
                                formKey.currentState!.reset();
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterUi(),
                                ),
                              );
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        SizedBox(height: 300),
                        Text(
                          'Ver.Demo',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
