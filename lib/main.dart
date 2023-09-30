import 'package:flutter/material.dart';
import 'package:news/ui/HomeScreen/Home_Screen.dart';
import 'package:news/ui/SplashScreen/Splash_Screen.dart';
import 'package:news/ui/light_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SplashScreen.routeName: (buildContext) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}

