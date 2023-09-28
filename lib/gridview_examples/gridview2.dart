import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView2(),
  ));
}
class GridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount:15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.primaries[index % Colors.primaries.length],
              child: const Text("Hello"),
            );
          }),
    );
  }
}
