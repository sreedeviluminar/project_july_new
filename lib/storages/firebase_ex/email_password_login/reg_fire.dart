import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_july_new/storages/firebase_ex/email_password_login/firebase_helper.dart';
import 'package:project_july_new/storages/firebase_ex/email_password_login/login_fire.dart';

class Register_Fire extends StatelessWidget {
  final R_uname = TextEditingController();
  final R_pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                "HELLO!! REGISTER HERE!!",
                style: GoogleFonts.habibi(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: R_uname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "UserName"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: R_pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {

                  final email = R_uname.text.trim();
                  final pswd = R_pass.text.trim();

                  FireBaseHelper().register(email: email, password: pswd).then((value) {
                    if (value == null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Fire()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                },
                color: Colors.deepOrangeAccent,
                height: 50,
                minWidth: 150,
                shape: const StadiumBorder(),
                child: const Text('Register'),
              ),
            ],
          ),
        ));
  }
}
