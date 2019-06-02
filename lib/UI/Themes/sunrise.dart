import 'package:flutter/material.dart';

ThemeData sunriseTheme() {
  return ThemeData(
    brightness: Brightness.light,
    dialogBackgroundColor: Colors.black87,
    backgroundColor: Colors.white,
    primaryColorLight: Colors.grey[900],
    fontFamily: 'Montserrat',
    primarySwatch: Colors.deepOrange,
    textTheme: TextTheme(
        title: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[900]
        ),
        subtitle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange
        ),
       display1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[900]
        ),
        body1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey[900]
        ),
        body2: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.grey[900]
        ),
        button: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey[900]
        ),
      ),
    );
}