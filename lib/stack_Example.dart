import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: StackEx()));
}
class StackEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack Ex"),),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: 500,
              color: Colors.red,
            ),
            Positioned(
              top: 280,
              left: 180,
              child: Container(
                height: 300,
                width: 300,
                color: Colors.green,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
