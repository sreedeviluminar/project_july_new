import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView5(),
  ));
}

class GridView5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.custom(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              /// childrenDelegate:SliverChildListDelegate([]), OR
              childrenDelegate:
                  SliverChildBuilderDelegate((context, index) => Stack(
                    children: [
                      Container(
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1518281420975-50db6e5d0a97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
                      ))),
                      const Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text(
                            '40\$',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      const Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    ],
                  ))),
        ));
  }
}
