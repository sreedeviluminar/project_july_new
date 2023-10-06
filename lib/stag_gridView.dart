import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main(){
  runApp(MaterialApp(home: StaggeredGriddd(),));
}
class StaggeredGriddd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Staggered Grid View'),
        ),
        body: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 5,
            children: const [
              StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1,
                  child: Card(
                    color: Colors.green,
                    child: Center(
                      child: Icon(Icons.account_balance),
                    ),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 3,
                  child: Card(
                    color: Colors.red,
                    child: Center(
                      child: Icon(Icons.account_circle_rounded),
                    ),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                  child: Card(
                    color: Colors.yellow,
                    child: Center(
                      child: Icon(Icons.spa),
                    ),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                      child: Icon(Icons.ac_unit_outlined),
                    ),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    color: Colors.pink,
                    child: Center(
                      child: Icon(Icons.accessibility_new),
                    ),
                  ))
            ],
          ),
        ));
  }
}
