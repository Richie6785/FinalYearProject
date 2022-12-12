import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'Home.dart';

class Hpage extends StatelessWidget {
  const Hpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance
            .authStateChanges(), //listen to any authstate changes
        builder: (context, snapshot) {
          //check a non null user
          if (snapshot.hasData) {
            //gives information about the user
            return const Home();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
