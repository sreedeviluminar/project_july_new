import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(home: SimpleAnimation()));
}

class SimpleAnimation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: 
        // RiveAnimation.asset(
        //   'assets/animation/phonegirl.riv',
        // ),
        RiveAnimation.network("https://public.rive.app/community/runtime-files/5997-11672-kitty-test-mouse-follow.riv")
      ),
    );
  }
}