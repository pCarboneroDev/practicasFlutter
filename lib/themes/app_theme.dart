import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColorLight = Colors.indigoAccent;
  static const Color iconColorLight = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
        primaryColor: primaryColorLight,

        appBarTheme: const AppBarTheme(
          color: primaryColorLight,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
          actionsIconTheme: IconThemeData(color: Colors.white)
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColorLight)
        )
      );
}