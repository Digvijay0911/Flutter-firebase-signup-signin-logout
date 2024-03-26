import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_signup_signin/views/signin_screen.dart';
import 'package:firebase_signup_signin/views/signup_screen.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey:
              "AIzaSyDuTW_ZiylMRqUi_rPVYFg8h1casvS2wfs", // google-services.json
          appId:
              "1:913426895833:android:e125e920babb11626ebfc8", // firebase --> project setting --> general
          messagingSenderId:
              "913426895833", // firebase --> project setting --> Cloud messaging
          projectId:
              "userauthentication-238c3", // firebase --> project setting --> general
          storageBucket:
              "userauthentication-238c3.appspot.com", // google-services.json
        ))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Signup_Screen(),
    );
  }
}
