import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_july_new/stateful_login.dart';
import 'loginPage.dart';
void main() {
  runApp(MaterialApp(
    home: Splash2(),
  ));
}
class Splash2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Splash2State(); // define an initial state for the page
}

class Splash2State extends State {
  @override
  void initState() {                // what should do when this page  is launched
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>Login_stateful()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //BuildContext - used to locate widgets on the widget tree and monitor their actions
    return Scaffold(
      //  backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.black38
          //  image: DecorationImage(
          //      fit: BoxFit.cover,
          //      image: NetworkImage("https://plus.unsplash.com/premium_photo-1672582776474-fc85ebaa1b73?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"))
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.green,
                  Colors.white70,
                  Colors.black12
                ])
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///adding built in icons
              // Icon(
              //   Icons.favorite,
              //   size: 80,
              //   color: Colors.red,
              // ),
              /// adding external icons (flutter accessed it as image)
              /// Asset image as image provider
              // Image(
              //   image: AssetImage("assets/icons/tree.png"),
              //   width: 100,
              //   height: 100,
              // ),
              /// network image as image provider
              const Image(
                image: NetworkImage("https://cdn1.iconfinder.com/data/icons/business-and-finance-flat/512/solving_puzzle_issue_thinking_solution-512.png"),
                width: 100, height: 100,
              ),
              Text(
                "My Application",
                style: GoogleFonts.dancingScript(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold
                ),
                // style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.blue,
                //     fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
