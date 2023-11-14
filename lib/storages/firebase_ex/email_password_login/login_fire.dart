import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_july_new/storages/firebase_ex/email_password_login/reg_fire.dart';

import 'firebase_helper.dart';
import 'home_fire.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBDLdz7qegczVSzzxCOcaOUwrnZ_zwzd-8",
          appId: "1:490313053840:android:7e09d6d151562af47cca15",
          messagingSenderId: '',
          projectId: "my-project-july-402304"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? Login_Fire() : Home_Fire(),
  ));
}

class Login_Fire extends StatelessWidget {
  final L_uname = TextEditingController();
  final L_pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                "HELLO!! LOGIN HERE!!",
                style: GoogleFonts.habibi(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: L_uname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "UserName"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: L_pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  final email = L_uname.text.trim();
                  final pswd = L_pass.text.trim();

                  FireBaseHelper()
                      .login(email: email, password: pswd)
                      .then((value) {
                    if (value == null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Fire()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                },
                color: Colors.purple,
                height: 50,
                minWidth: 150,
                shape: const StadiumBorder(),
                child: const Text('LOGIN'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register_Fire()));
                  },
                  child: const Text('Not a User? Register Here!!'))
            ],
          ),
        ));
  }
}
