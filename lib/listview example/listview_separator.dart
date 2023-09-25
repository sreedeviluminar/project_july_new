import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(MaterialApp(
    home: ListView_Separated(),
  ));
}
class ListView_Separated extends StatelessWidget {
  const ListView_Separated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.Separator"),
      ),
      body: ListView.separated(
          itemBuilder: (ctx,i){
           return const Card(
              child: FaIcon(FontAwesomeIcons.whatsapp,
                color: Colors.teal,),
              //Image.asset("assets/images/person.jpeg"),
            );
          },
          separatorBuilder: (context,index){
            if(index % 4 == 0) {
              return  Divider(
                color: Colors.primaries[index % Colors.primaries.length],
                thickness: 3,);
            }else{
              return SizedBox();
            }
          },
          itemCount: 30),
    );
  }
}
