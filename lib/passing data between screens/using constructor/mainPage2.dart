import 'package:flutter/material.dart';
import 'package:project_july_new/passing%20data%20between%20screens/using%20constructor/toStatefulPage.dart';
import 'package:project_july_new/passing%20data%20between%20screens/using%20constructor/toStatelessPage.dart';
import 'package:project_july_new/passing%20data%20between%20screens/using%20navigator/dummydata.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage2(),
  ));
}

class MainPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Passing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        DataStateless(
                        name: "Luminar",
                        location: "Kakkanad",
                        phone: 98765432,
                        img : products[0]['image']))),
                child: const Text('To StateLess')),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        DataStateful(
                            name: "Luminar",
                            location: "Kakkanad",
                            phone: 98765432,
                            img : products[3]['image']))),
                child: const Text('To StateFul')),
          ],
        ),
      ),
    );
  }
}
