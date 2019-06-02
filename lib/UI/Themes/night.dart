import 'package:flutter/material.dart';

ThemeData nightTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    dialogBackgroundColor: Colors.black87,
    backgroundColor: Colors.grey[900],
    primaryColorLight: Colors.grey[200],
    fontFamily: 'Montserrat',
    primarySwatch: Colors.deepOrange,
    textTheme: TextTheme(
        title: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[200]
        ),
        subtitle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange
        ),
       display1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[200]
        ),
        body1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey[200]
        ),
        body2: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.grey[200]
        ),
        button: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey[200]
        ),
      ),
    );
}