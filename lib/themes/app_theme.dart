import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColorLight = Colors.indigoAccent;
  static const Color primaryColor2 = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
        primaryColor: primaryColorLight,

        // Appbar Theme
        appBarTheme: const AppBarTheme(
          color: primaryColorLight,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),

        // Text button Theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColorLight)
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColorLight,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColorLight
          ),
        ),


        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primaryColor2),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor2,
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor2,
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
          )
        )
      );
}