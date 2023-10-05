import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Navdrawer(),
  ));
}

class Navdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topRight,
                  colors: [Colors.pink, Colors.white, Colors.blue])),
          child: ListView(
            children: [
              SizedBox(
                width: 150,
                height: 50,
              ),
              const ListTile(
                title: Text("Deviletha Sai"),
                subtitle: Text("devisai91@gmail.com"),
                trailing: Icon(Icons.close),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://media.istockphoto.com/id/1354205468/photo/portrait-of-beautiful-indian-it-programmer-working-on-desktop-computer-smiling-and-looking-at.jpg?b=1&s=170667a&w=0&k=20&c=1fdU1ajrv4UmxMLJStAvvIx5A9nBAV4VGJ7ThlUN0_E="),
                  radius: 30,
                ),
              ),
              SizedBox(
                width: 100,
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.dashboard_outlined),
                title: Text("Dashboard"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => DrawerHome()));
                },
              ),
              ListTile(
                leading: Icon(Icons.leaderboard_outlined),
                title: Text("Leads"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.man_outlined),
                title: Text("Clients"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.notification_important_sharp),
                title: Text("Projects"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.man_sharp),
                title: Text("Partners"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.subscriptions_outlined),
                title: Text("Subscription"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.payments_outlined),
                title: Text("Payments"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle_sharp),
                title: Text("Users"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.library_add_check_rounded),
                title: Text("Library"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.local_activity),
                title: Text("Local Activity"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(
                width: 250,
                height: 30,
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Log Out"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[200],
                      shadowColor: Colors.redAccent[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text('DashBoard'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1673697239984-b089baf7b6e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww&w=1000&q=80"))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pradeep Prakash",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )),
          ),
          const Expanded(
            child:  SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("""
                 In January 2001, Wikipedia began as a side-project of Nupedia, to allow collaboration on articles prior to entering the peer-review process. The name was suggested by Sanger on 11 January 2001 as a portmanteau of the words wiki (Hawaiian for "quick") and encyclopedia.
                  In January 2001, Wikipedia began as a side-project of Nupedia, to allow collaboration on articles prior to entering the peer-review process. The name was suggested by Sanger on 11 January 2001 as a portmanteau of the words wiki (Hawaiian for "quick") and encyclopedia.
                   In January 2001, Wikipedia began as a side-project of Nupedia, to allow collaboration on articles prior to entering the peer-review process. The name was suggested by Sanger on 11 January 2001 as a portmanteau of the words wiki (Hawaiian for "quick") and encyclopedia.
                    In January 2001, Wikipedia began as a side-project of Nupedia, to allow collaboration on articles prior to entering the peer-review process. The name was suggested by Sanger on 11 January 2001 as a portmanteau of the words wiki (Hawaiian for "quick") and encyclopedia.
                """),
              ),
            ),
          )
        ],
      ),
    );
  }
}
