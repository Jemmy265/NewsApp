import 'package:flutter/material.dart';
import 'package:news/ui/HomeScreen/Home_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (buildContext)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Color(0xff39A552),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30)
            ),
          )
        )
      ),
    );
  }
}

