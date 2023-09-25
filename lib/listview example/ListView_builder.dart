import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListView_Builder(),
  ));
}

class ListView_Builder extends StatelessWidget {

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
        title: const Text("ListView Builder"),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.insert_link_outlined),
              backgroundColor: Colors.teal,
            ),
            title:Text("Create Call Link") ,
            subtitle:Text('Share a link'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text("Recent"),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),// turn off scrolling property of inner listview
            shrinkWrap: true,
          itemCount: 10,
            itemBuilder: (context, index) {
          return  ListTile(
            title: Text("hello"),
            subtitle: const Row(
              children: [
                Icon(Icons.call_missed_rounded,
                  color: Colors.red,),
                Text("25 Sep 2023,"),
                Text('10.07')
              ],
            ),
            leading: Image.asset(images[index]),
            trailing: Icon(Icons.call),
          );
        }),
      ]
      ),
    );
  }
}
