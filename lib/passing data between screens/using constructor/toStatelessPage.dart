import 'package:flutter/material.dart';
class DataStateless extends StatelessWidget {
   String name;
   String? location;
   int phone;
   String img;
   DataStateless({this.location, required this.name,
     required this.phone, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(img,height: 100,),
            Text("Name     : $name",style: const TextStyle(fontSize: 40),),
            Text("Location : $location",style: const TextStyle(fontSize: 30),),
            Text("Phone    : $phone",style: const TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
