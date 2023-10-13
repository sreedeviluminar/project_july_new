import 'package:flutter/material.dart';
import 'package:project_july_new/custom%20widget/refractoring%20widget.dart';
void main(){
  runApp(MaterialApp(home: Grid_with_Refractoring()));
}
class Grid_with_Refractoring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid with Refractoring Widget"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        children: [
          Custom_Card(
            image: const NetworkImage(
                "https://images.unsplash.com/photo-1696257203553-20ada15fce65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=900&q=60"),
            text: "MyProduct",
            click: () {},
            click1: () {},
          ),
          Custom_Card(
            image: const NetworkImage(
                "https://images.unsplash.com/photo-1696257203553-20ada15fce65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=900&q=60"),
            text: "MyProduct 2",
            click: () {},
            click1: () {},
          ),
        ],
      ),
    );
  }
}
