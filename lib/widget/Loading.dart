import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_demo/screens/login_ui.dart';

class LoadingUi extends StatefulWidget {
  const LoadingUi({super.key});

  @override
  State<LoadingUi> createState() => _LoadingUiState();
}

class _LoadingUiState extends State<LoadingUi> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginUi();
          }
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}
