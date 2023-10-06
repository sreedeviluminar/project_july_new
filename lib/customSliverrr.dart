import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: SliverEx(),));
}
class SliverEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            title: const Text('Sliver Example'),
            bottom: AppBar(
              elevation: 0,
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                width: double.infinity,
                height: 40,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: Icon(Icons.camera_alt_outlined),
                      prefixIcon: Icon(Icons.search_rounded)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) => const Card(
                            child: ListTile(
                              leading: Icon(Icons.account_circle),
                              title: Text("Name"),
                              subtitle: Text('9876543111'),
                            ),
                  )))
        ],
      ),
    );
  }
}
