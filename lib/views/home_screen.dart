import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signup_signin/views/signup_screen.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                print("User successfully signout");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Signup_Screen()),
                    (Route<dynamic> route) => false);
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
