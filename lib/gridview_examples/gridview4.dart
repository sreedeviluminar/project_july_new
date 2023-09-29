import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(MaterialApp(home: GridView4(),));
}
class GridView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
          maxCrossAxisExtent: 200,
      children: List.generate(10,
              (index) => Card(
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.children,size: 30,),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text('Children',
                        style: TextStyle(fontSize: 20,
                        color: Colors.primaries[index % Colors.primaries.length],),),
                    )
                  ],
                ),
              )),),
    );
  }
}
