import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Image.asset(
                "assets/icons/tree.png",
                height: 100,
                width: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: TextField(
                  decoration:InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                      prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))
                      )
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration:InputDecoration(
                      hintText: "PhoneNumber",
                      labelText: "PhoneNumber",
                      helperText: 'Enter the existing phone number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))
                      )
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  decoration:InputDecoration(
                      hintText: "UserName",
                      labelText: "UserName",
                      helperText: 'UserName Must be an Email',
                      prefixIcon: Icon(Icons.people_alt_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))
                      )
                  ),
                ),
              ),
              // SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: TextField(
                  decoration:InputDecoration(
                      hintText: "PassWord",
                      labelText: "PassWord",
                      helperText: 'Password Must Contain 6 characters',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))
                      )
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: TextField(
                  decoration:InputDecoration(
                      hintText: "Confirm PassWord",
                      labelText: "Confirm  PassWord",
                      helperText: 'Password Must be same',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))
                      )
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register")),

            ],
          ),
        ),
      ),
    );
  }
}
