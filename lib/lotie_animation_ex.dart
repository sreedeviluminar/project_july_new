import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(home: LottieEx(),));
}
class LottieEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        Lottie.asset("assets/animation/animation.json"),
        //Lottie.network("https://lottie.host/7c97a2c6-3344-4baf-a361-5be7a9b215b3/XXgnyR9rYl.json")
      ),
    );
  }
}
