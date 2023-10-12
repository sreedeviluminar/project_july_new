import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: ClipWidget(),
  ));
}

class ClipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ///ClipRect
            ClipRect(
              child: Container(
                child: Align(
                  widthFactor: .4,
                  heightFactor: .6,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.unsplash.com/photo-1696835922210-6f4f4f2dc7e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=407&q=80"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///ClipRRect
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Container(
                child: Image.network(
                    "https://images.unsplash.com/photo-1504600770771-fb03a6961d33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1182&q=80"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ///ClipOval
            ClipOval(
              child: Image.network("https://images.unsplash.com/photo-1696921881903-e87e5662d9b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipOval(
              child: Image.network("https://images.unsplash.com/photo-1696943444991-def9485f89f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
            ),
            SizedBox(height: 20.0,),
            ClipPath(
              clipper:StarClipper(8),
              child: Image.network("https://images.unsplash.com/photo-1696943444991-def9485f89f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80")
            ),

          ],
        ),
      ),
    );
  }
}
