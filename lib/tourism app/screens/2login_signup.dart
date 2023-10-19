import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_SigUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/tour.png",
            width: 250,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0,
                vertical: 5),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                  title: Text("Login Here"),
                  trailing: Icon(Icons.people_alt_outlined)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0,
                vertical: 5),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                  title: Text("Register Here"),
                  trailing: Icon(Icons.person_add_outlined)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0,
                vertical: 5),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                  title: Text("Login With Facebook"),
                  trailing: FaIcon(FontAwesomeIcons.facebook)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0,
            vertical: 5),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                  title: Text("Login With Google"),
                  trailing: FaIcon(FontAwesomeIcons.google)),
            ),
          )
        ]),
      ),
    );
  }
}
