import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_july_new/tourism%20app/screens/3login.dart';
import 'package:project_july_new/tourism%20app/screens/4signup.dart';
import 'package:project_july_new/tourism%20app/screens/5home.dart';
import 'package:project_july_new/tourism%20app/screens/6details.dart';
import 'package:project_july_new/tourism%20app/screens/7explorenow.dart';
import 'package:project_july_new/tourism%20app/screens/8payments.dart';
import '2login_signup.dart';

void main() {
  runApp(MaterialApp(
    home: IntroScreen(),
    routes: {
      'login': (context) => Tourism_Login(),
      'register': (context) => Tour_SignUp(),
      'home': (context) => Tour_Home(),
      'details': (context) => Tour_Details(),
      'explore': (context) => Tour_Explore(),
      'payment': (context) => Tour_Payment(),
    },
  ));
}

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login_SigUp()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/tour.png",
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
