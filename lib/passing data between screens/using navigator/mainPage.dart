import 'package:flutter/material.dart';
import 'package:project_july_new/passing%20data%20between%20screens/using%20navigator/detailsPage.dart';
import 'package:project_july_new/passing%20data%20between%20screens/using%20navigator/dummydata.dart';

void main() {
  runApp(MaterialApp(
    home: ProductMain(),
    routes: {
      'details': (context) => ProductDetails(),
      // 'home':(context) => Home()
    },
  ));
}

class ProductMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        /// products list le oro map um one by one ayit  product il varum since list.map() is iterable
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: products
            .map((product) => InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed('details', arguments: product['id']),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(product['image'])))),
                        Text(product['name']),
                        Text('${product['price']}\$'),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
