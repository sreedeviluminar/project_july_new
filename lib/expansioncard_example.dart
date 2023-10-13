import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ExpansionTileEx()));
}
class ExpansionTileEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("expansion card"),
      ),
      body: const Column(
        children: [
          ExpansionTile(
            title: Text('Colors'),
            subtitle: Text("Expand to view  More"),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
                title: Text('Pink'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text('Green'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text('Red'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),
                title: Text('Yellow'),
              )
            ],
          ),
          ExpansionTile(
            title: Text('Colors'),
            subtitle: Text("Expand to view  More"),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
                title: Text('Pink'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text('Green'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text('Red'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),
                title: Text('Yellow'),
              )
            ],
          )
        ],
      ),
    );
  }
}
