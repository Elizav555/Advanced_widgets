import 'package:flutter/material.dart';

enum ThemeType { light, dark, red, green, blue }

final appThemes = {
  ThemeType.light: ThemeData.light(),
  ThemeType.dark: ThemeData.dark(),
  ThemeType.red: ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red[100],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.pinkAccent),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      )),
  ThemeType.green: ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green[100],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreenAccent),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      )),
  ThemeType.blue: ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.blue[100],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.cyanAccent),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      )),
};
