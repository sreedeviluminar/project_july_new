import 'package:flutter/material.dart';

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
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 80,
              color: Colors.red,
            ),
            Text(
              "My Application",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
              fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
