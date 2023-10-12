import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_july_new/StateFul_Splash.dart';
void main(){
  runApp(MaterialApp(home: IntroScreenn(),));
}
class IntroScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageDecoration decorationPage = const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        bodyTextStyle: TextStyle(
            fontSize: 20, fontStyle: FontStyle.italic, color: Colors.brown),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.yellow, Colors.orangeAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
         imageFlex: 1,
      //fullScreen: true
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: decorationPage,
            title: 'First Page',
            body:
                "Introduction/Onboarding package for flutter app with some customizations possibilities Introduction/Onboarding",
            image: IntroImage(
                "https://images.unsplash.com/photo-1668277374062-727773dde8e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80")),
        PageViewModel(
            decoration: decorationPage,
            title: 'Second Page',
            body:
                "Introduction/Onboarding package for flutter app with some customizations possibilities Introduction/Onboarding",
            image: IntroImage(
                "https://images.unsplash.com/photo-1695751240180-6194e4d152a8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=928&q=80")),
        PageViewModel(
            decoration: decorationPage,
            title: 'Third Page',
            body:
                "Introduction/Onboarding package for flutter app with some customizations possibilities Introduction/Onboarding",
            image: IntroImage(
                "https://images.unsplash.com/photo-1694365349735-f9ccbb380a47?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80"))
      ],
      onSkip: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Splash2()),
      ),
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Splash2()),
      ),
      showSkipButton: true,
      skip: const Text('Skip'),
      // showBackButton: true,
      // back: const Text('Back'),
      next: const Icon(Icons.arrow_forward_rounded),
      done: const Text("Done"),
      dotsDecorator: const DotsDecorator(
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(25))),
          size: Size(12, 10),
          activeSize: Size(22, 10),
          activeColor: Colors.green),
    );
  }

  Widget IntroImage(String imgpath) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
              image: NetworkImage(imgpath))
        ),
        ),
    );
  }
}
