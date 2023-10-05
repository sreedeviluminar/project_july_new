import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: DraweEx(),));
}
class DraweEx extends StatelessWidget {
  const DraweEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY DRAWER'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1673697239984-b089baf7b6e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww&w=1000&q=80"))),
              accountName: Text('Pradeep'),
              accountEmail: Text('pradeepgp@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW4lMjBmYWNlfGVufDB8fDB8fHww&w=1000&q=80"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage:AssetImage(
                      "assets/images/person.jpeg"),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "assets/images/pizza.png"),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Favorite'),
            ),
            ListTile(
              leading: Icon(Icons.work_history_rounded),
              title: Text('WorkFlow'),
            ),
            ListTile(
              leading: Icon(Icons.park_rounded),
              title: Text('Notification'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )

          ],
        ),
      ),
    );
  }
}
