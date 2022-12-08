import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/screens/login_ui.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
                )),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(Icons.home),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  'Recommend',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  'Profiles',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
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
                  child: Text(
                    'LOGOUT',
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 30,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Icon(Icons.search),
                  hintText: 'search',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
