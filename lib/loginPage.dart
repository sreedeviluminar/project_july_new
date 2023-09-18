import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: Login_Page(),
//   ));
// }
class Login_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Image.asset(
              "assets/icons/tree.png",
              height: 100,
              width: 100,
            ),
            Text(
              "My App July",
              style: GoogleFonts.cabinSketch(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.teal
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: TextField(
                decoration:InputDecoration(
                  hintText: "UserName",
                  labelText: "UserName",
                  helperText: 'UserName Must be an Email',
                  prefixIcon: Icon(Icons.account_circle),
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
            ElevatedButton(
                onPressed: () {},
                child: const Text("Login")),
            TextButton(
                onPressed: () {},
                child: const Text('Not a User? SignUp Here!!!!'))
          ],
        ),
      ),
    );
  }
}

/// image widgets
/// Image(image:)
/// Image.asset()
/// Image.network()
