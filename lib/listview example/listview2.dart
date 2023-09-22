import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ListView2(),));
}

class ListView2 extends StatelessWidget {
  var title = [
    'Data1',
    'Data2',
    'Data3',
    'Data4',
    'Data5',
    'Data6',
    'Data7',
    'Data8',
    'Data9',
    'Data10'
  ];
  var subti = [20, 30, 40, 50, 100, 140, 150, 310, 200, 190];
  var images = [
    "assets/images/bananas.png",
    "assets/images/bibimbap.png",
    "assets/images/donut.png",
    "assets/images/grapes.png",
    "assets/images/hamburger.png",
    "assets/images/orange.png",
    "assets/images/pineapple.png",
    "assets/images/pizza.png",
    "assets/images/ramen.png",
    "assets/images/salad.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView 2"),
      ),
      body: ListView(
        children: List.generate(10, (index) =>
            Card(
              child: ListTile(
                title: Text(title[index]),
                subtitle: Text('${subti[index]}'),
                leading: Image.asset(images[index]),
              ),
            )),
      ),
    );
  }
}
