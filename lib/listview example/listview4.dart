import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: ListView4(),));
}
class ListView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
          childrenDelegate: SliverChildListDelegate([
        Card(
          child: Icon(Icons.account_balance),
        ),
        Card(
          child: Icon(Icons.account_balance),
        ),
        Card(
          child: Icon(Icons.account_balance),
        ),
        Card(
          child: Icon(Icons.account_balance),
        ),
      ])
          // childrenDelegate: SliverChildBuilderDelegate(
          //     (context, index) => Card(
          //           child: Icon(Icons.account_balance),
          //         ),
          //     childCount: 10),
          ),
    );
  }
}
