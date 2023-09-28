import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: GridView1(),));
}
class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView1'),
        ),
        body: GridView(
          //this is to show how items will placed in cross axis
         // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
          children: List.generate(20,
              (index) => Card(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Icon(Icons.adb),
                  )),
        ));
  }
}
