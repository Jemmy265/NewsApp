import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/ui/HomeScreen/Home_Screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "Splash";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Stack(
      children: [
        Container(
          child: Image.asset(
            "assets/images/Background.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        Center(
          child: Image.asset("assets/images/logo.png"),
        )
      ],
    );
  }
}
