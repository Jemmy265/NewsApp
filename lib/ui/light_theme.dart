import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static ThemeData lightTheme = ThemeData(
      primaryColor: Color(0xff39A552),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 70,
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          color: Color(0xff39A552),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          )),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xff4F5A69)),
          bodySmall: TextStyle(fontSize: 22, color: Colors.white),
          titleSmall: TextStyle(fontSize: 14, color: Colors.white),
          titleMedium: TextStyle(
            fontSize: 10,
            color: Color(0xff79828B),
          ),
          titleLarge: TextStyle(
            fontSize: 13,
            color: Color(0xffA3A3A3),
          )));
}
