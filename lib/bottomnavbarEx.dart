import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_july_new/fi%20card%20using_stack.dart';
import 'package:project_july_new/gridview_examples/gridview2.dart';
import 'package:project_july_new/gridview_examples/gridview5.dart';
import 'package:project_july_new/stateful_login.dart';

void main() {
  runApp(MaterialApp(
    home: BottomBarEx(),
  ));
}

class BottomBarEx extends StatefulWidget {
  @override
  State<BottomBarEx> createState() => _BottomBarExState();
}

class _BottomBarExState extends State<BottomBarEx> {
  int index = 0;
  var screens = [
    FiCard(),
    GridView2(),
    GridView5(),
    Login_stateful()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
          TabItem(icon: Icons.account_box),

        ],
        initialActiveIndex: index,
        onTap: (tapedindex) {
          setState(() {
            index =
                tapedindex; // here index value change according to each tap
          });
        }
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //      type: BottomNavigationBarType.fixed,
      //    // type: BottomNavigationBarType.shifting,
      //     elevation: 5,
      //     backgroundColor: Colors.green,
      //     selectedItemColor: Colors.yellow,
      //     currentIndex: index,
      //     onTap: (tapedindex) {
      //       setState(() {
      //         index =
      //             tapedindex; // here index value change according to each tap
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //           backgroundColor: Colors.brown,
      //           icon: Icon(Icons.home),
      //           label: "Home"),
      //       BottomNavigationBarItem(
      //           backgroundColor: Colors.green,
      //           icon: Icon(Icons.add_box_rounded),
      //           label: 'Reels'),
      //       BottomNavigationBarItem(
      //           backgroundColor: Colors.red,
      //           icon: Icon(Icons.park_rounded),
      //           label: 'Notify'),
      //       BottomNavigationBarItem(
      //           backgroundColor: Colors.blue,
      //           icon: Icon(Icons.account_box),
      //           label: 'Profile')
      //     ]),
      body: screens[index],
    );
  }
}
