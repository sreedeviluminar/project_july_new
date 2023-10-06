import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: StaggeredGriddd2(),
  ));
}

class StaggeredGriddd2 extends StatelessWidget {
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
  var cac = [2, 2, 2, 2, 3, 2, 2, 3, 2, 1];
  var mac = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Staggered Grid View'),
        ),
        body: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            children: List.generate(
                10,
                (index) => StaggeredGridTile.count(
                      crossAxisCellCount: cac[index],
                      mainAxisCellCount: mac[index],
                      child: Card(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        child: Image.asset(images[index]),
                      ),
                    )),
          ),
        ));
  }
}
