import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_july_new/passing%20data%20between%20screens/using%20navigator/dummydata.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // id from previous page
    var id = ModalRoute.of(context)?.settings.arguments;
    // products list oro map um product il varum , previous page le tap cheith cheitha id , e id k
  // matching aya id products list il undonu check cheyyum , undenkil aa single map product il store cheyum
    var product = products.firstWhere((product) => product['id'] == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(product['image'],height: 200,width: 200,),
            Text(product['name'],style: GoogleFonts.fahkwang(fontSize: 40),),
            Text('${product['price']}',style: TextStyle(fontSize: 30),),
            Text('${product['rating']}',style: TextStyle(fontSize: 20)),
            Text(product['description'],style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
