import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle scoreBoardStyle =
    TextStyle(fontSize: 108, fontWeight: FontWeight.bold);

ThemeData blueTheme = ThemeData(
    primaryColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: Colors.lightBlueAccent,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.lightBlueAccent),
    visualDensity: VisualDensity.adaptivePlatformDensity);

ThemeData redTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[900]),
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.red),
    visualDensity: VisualDensity.adaptivePlatformDensity);

Text blueText = Text('Blue', style: TextStyle(color: Colors.lightBlueAccent));
Text redText = Text('Red', style: TextStyle(color: Colors.red));
