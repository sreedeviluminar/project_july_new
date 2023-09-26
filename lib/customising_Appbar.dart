import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_july_new/listview%20example/listview2.dart';
import 'package:project_july_new/listview%20example/listview_constructor.dart';
import 'package:project_july_new/listview%20example/listview_separator.dart';
import 'package:project_july_new/stateful_login.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppBar1(),
  ));
}

class AppBar1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("WhatsApp"),
          actions: [
            const Icon(Icons.camera_alt_outlined),
            const SizedBox(
              width: 15,
            ),
            const Icon(Icons.search_rounded),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("New BroadCast")),
                const PopupMenuItem(child: Text("New Group")),
              ];
            }),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Container(
                child:  const TabBar(
                  tabs: [
                    Tab(
                      icon:FaIcon(FontAwesomeIcons.users) ,
                    ),
                    Tab(
                      text:"Chats" ,
                    ),
                    Tab(
                      text:"Status" ,
                    ),
                    Tab(
                      text:"Calls" ,
                    )
                  ],
                ),
              )),
        ),
        body: TabBarView(
            children: [
              Login_stateful(),
              const ListView_Separated(),
              ListView2(),
              ListView1(),
            ]) ,
      ),
    );
  }
}
