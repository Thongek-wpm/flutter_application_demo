// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/model/api.dart';

import 'package:flutter_application_demo/screens/login_ui.dart';
import 'package:flutter_application_demo/screens/view_api.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final auth = FirebaseAuth.instance;
  //firebaseAuth login
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // ignore: prefer_typing_uninitialized_variables
  var results;

  Future saveLoginTypeToSP(String profile) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var collection = FirebaseFirestore.instance.collection('profiles');
    var querySnapshot = await collection.get();
    // shared preferences
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      var email = data['email'];
      if (email == email) {
        String docId = doc.id;
        sp.setString('userId', docId);
        sp.setString('email', email);
        sp.setString('fullName', data['fullName']);
        sp.setString('phone', data['phone']);
        sp.setString('password', data['password']);
      }
    }
  }

  // ignore: prefer_typing_uninitialized_variables

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
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/background-blue.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/image/camera-icon.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    auth.currentUser!.email!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.list),
              title: Text(
                'Recommend',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profiles',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: ListTile(
                title: ElevatedButton(
                  onPressed: () {
                    auth.signOut().then(
                          (value) => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginUi();
                                },
                              ),
                            ),
                          },
                        );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    'LOGOUT',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: WebApiService().feed(),
            builder: ((context, snapshot) {
              if (snapshot.hasData == false) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final coffee = snapshot.data;
              return ListView.builder(
                  itemCount: coffee!.length = 19,
                  itemBuilder: ((context, index) {
                    return Card(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.network(
                                  coffee[index].image,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              coffee[index].headtitle,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              coffee[index].description,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAPI(),
                                      ));
                                },
                                child: Text(
                                  'LEARN MORE',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                )),
                          )
                        ],
                      ),
                    );
                  }));
            })),
      ),
    );
  }
}
