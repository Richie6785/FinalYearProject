import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelapp/mainpage.dart';

void main() async {
  //async is used to make the function asynchronous. We can to continue acess from our project to the firebase backend
  WidgetsFlutterBinding
      .ensureInitialized(); //this gives access to the native code
  await Firebase.initializeApp(); //this gives access to the firebase backend

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //this is the main class
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue, //sets the primary color
      ),
      home: const Hpage(), //sets the home page
    );
  }
}
