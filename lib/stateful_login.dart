import 'package:flutter/material.dart';
import 'package:project_july_new/home.dart';
import 'package:project_july_new/stateful_registration.dart';

class Login_stateful extends StatefulWidget {
  @override
  State<Login_stateful> createState() => _Login_statefulState();
}
class _Login_statefulState extends State<Login_stateful> {
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
              Image.asset("assets/icons/tree.png",height: 200,width: 150,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    hintText: 'Username'
                  ),
                  ///here the value entered at text form field will stored at uname
                  validator: (uname){
                    if(uname!.isEmpty || uname != username){
                      return 'username must not be empty/ or invalid';
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (password){
                    if(password!.isEmpty || password != pass){
                      return 'Password must not be empty/ password length must be > 6';
                    }else{
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                  hintText: 'Password'),
                ),
              ),
              ElevatedButton(onPressed: () {
                final valid = key1.currentState!.validate();
                if(valid){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Inavlid datas')));
                }
              }, child: Text("Login")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reg_stateful()));
                  },
                  child: const Text('Not a User? SignUp Here!!!!'))
            ],
          ),
        ),
      ),
    );
  }
}
