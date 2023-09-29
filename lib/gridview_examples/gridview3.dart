import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: GridView3(),));
}
class GridView3 extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
                10,
                (index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.primaries[index % Colors.primaries.length],),
                      child: Column(
                        children: [
                          Image.asset(images[index],height: 100,),
                          const Text(
                            "Food 1",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "120 \$",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ))),
      ),
    );
  }
}
