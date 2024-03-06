import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welocome to",
          body: "Nasari Digital",
          image: Container(
            color: Colors.lightBlue[300],
            padding: EdgeInsets.only(bottom: 54),
          ),
          decoration: PageDecoration(
            safeArea: 10,
            imageFlex: 1,
            bodyFlex: 2,
            fullScreen: true,
            titleTextStyle: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            bodyTextStyle: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        PageViewModel(
          title: "Todo List Application",
          body: "This app created for technical test made by Fathu Rahman",
          image: Container(
            color: Colors.green[300],
            padding: EdgeInsets.only(bottom: 54),
          ),
          decoration: PageDecoration(
            safeArea: 10,
            imageFlex: 1,
            bodyFlex: 2,
            fullScreen: true,
            titleTextStyle: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            bodyTextStyle: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
      done: Text("Let's get started",
          style: TextStyle(color: Colors.white, fontSize: 16)),
      onDone: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isFirstTime', false);
        Navigator.pushNamed(
          context,
          "/login",
        );
      },
      showSkipButton: true,
      showNextButton: false,
      skip: Text("Skip", style: TextStyle(color: Colors.white, fontSize: 16)),
      onSkip: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isFirstTime', false);
        Navigator.pushNamed(
          context,
          "/login",
        );
      },
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white70,
        activeColor: Colors.white,
        activeSize: Size(40.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
