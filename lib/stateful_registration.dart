import 'package:flutter/material.dart';
import 'package:project_july_new/stateful_login.dart';

class Reg_stateful extends StatefulWidget {
  @override
  State<Reg_stateful> createState() => _Reg_statefulState();
}

class _Reg_statefulState extends State<Reg_stateful> {
  final formkey = GlobalKey<FormState>();
  String? pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset("assets/icons/tree.png",height: 200,width: 150,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Username'),
                  ///here the value entered at text form field will stored at uname
                  validator: (uname) {
                    if (uname!.isEmpty ||
                        !uname.contains('@') ||
                        !uname.contains('.com')) {
                      return 'username must not be empty/ or invalid';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone Number'),
                  validator: (num) {
                    if (num!.isEmpty || num.length != 10) {
                      return 'Phone number should have 10 digits/ field must not be empty';
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
                    pass = password;
                    if (password!.isEmpty || password.length < 6) {
                      return 'Password must not be empty/ password length must be > 6';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (cpassword) {
                    if (cpassword!.isEmpty || cpassword != pass) {
                      return 'Password must be same/ field must not be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password'),
                ),
              ),
              ElevatedButton(onPressed: () {
                final valid = formkey.currentState!.validate();
                if(valid){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>Login_stateful()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inavlid datas'))
                  );
                }
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}