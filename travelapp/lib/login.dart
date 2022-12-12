// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller =
      TextEditingController(); //this is used to get the value of the textfield
  final passwordcontroller =
      TextEditingController(); //this is used to get the value of the textfield

  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text
            .trim(), //trim is used to remove any extra spaces
        password: passwordcontroller.text
            .trim()); //trim is used to remove any extra spaces
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 135, 172, 202),
      body: SafeArea(
        child: Center(
          //Wrap the child in a Center widget to center it
          // ignore: prefer_const_literals_to_create_immutables
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.iso_outlined, size: 100, color: Colors.white),
              const SizedBox(
                height: 12,
              ), //SizedBox is used to create space between widgets
              Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ), //SizedBox is used to create space between widgets
              Text(
                'Welcome to the Login page',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ), //SizedBox is used to create space between widgets
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:
                      emailcontroller, //this is used to get the value of the textfield
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ), //SizedBox is used to create space between widgets
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ), //SizedBox is used to create space between widgets

              //sign in button
              ElevatedButton(
                onPressed: () {
                  signin();
                },
                child: Text('Sign in'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ), //SizedBox is used to create space between widgets

              Text('Dont have a account?',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              Text('Register here',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ]),
          ),
        ),
      ),
    );
  }
}
