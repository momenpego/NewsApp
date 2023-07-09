import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.teal),
      )),
      scaffoldBackgroundColor: Colors.grey[100],
      dividerTheme: const DividerThemeData(thickness: 2),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle:
              TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.red));
}
