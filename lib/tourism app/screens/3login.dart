import 'package:flutter/material.dart';
import 'package:project_july_new/tourism%20app/screens/4signup.dart';
import 'package:project_july_new/tourism%20app/screens/5home.dart';

class Tourism_Login extends StatefulWidget {
  @override
  State<Tourism_Login> createState() => _Tourism_LoginState();
}

class _Tourism_LoginState extends State<Tourism_Login> {
  String username = "admin@gmail.com";
  String pass = 'abc123';
  final key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key1,
          child: Column(
            children: [
              Image.asset(
                "assets/images/tour.png",
                height: 200,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Username'),
                  ///here the value entered at text form field will stored at uname
                  validator: (uname) {
                    if (uname!.isEmpty || uname != username) {
                      return 'username must not be empty/ or invalid';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (password) {
                    if (password!.isEmpty || password != pass) {
                      return 'Password must not be empty/ password length must be > 6';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final valid = key1.currentState!.validate();
                    if (valid) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Tour_Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Inavlid datas')));
                    }
                  },
                  child: Text("Login")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Tour_SignUp()));
                  },
                  child: const Text('Not a User? SignUp Here!!!!'))
            ],
          ),
        ),
      ),
    );
  }
}
