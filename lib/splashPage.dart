import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //to run an app
  runApp(MaterialApp(
    // default theme of our flutter app
    home: SplashPage(), // initial page to be launched while running an app
  ));
}

class SplashPage extends StatelessWidget {
  @override
  //to create our widget tree we use build function
  Widget build(BuildContext context) {
    //BuildContext - used to locate widgets on the widget tree and monitor their actions
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
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
            Image(
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
    );
  }
}
