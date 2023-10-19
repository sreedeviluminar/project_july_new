import 'package:flutter/material.dart';
import 'package:project_july_new/storages/simple%20login/loginshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_Shared extends StatefulWidget {
  @override
  State<Home_Shared> createState() => _Home_SharedState();
}

class _Home_SharedState extends State<Home_Shared> {
  late SharedPreferences prefs;
  String? user;

  @override
  void initState() {
  fetchUser();
  }

  void fetchUser() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString('username');
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome $user'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  prefs.setBool('firstlogin', true);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Login_Shared()));
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
