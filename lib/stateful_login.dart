import 'package:flutter/material.dart';

class Login_stateful extends StatefulWidget {
  @override
  State<Login_stateful> createState() => _Login_statefulState();
}
class _Login_statefulState extends State<Login_stateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: 'Username'
              ),
              ///here the value entered at text form field will stored at uname
              validator: (uname){
                if(uname!.isEmpty || !uname.contains('@') || !uname.contains('.com')){
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
                if(password!.isEmpty || password.length < 6){
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
          ElevatedButton(onPressed: () {}, child: Text("Login"))
        ],
      ),
    );
  }
}
