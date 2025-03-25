import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen()
      },
      theme: ThemeData.light().copyWith(

        scaffoldBackgroundColor: const Color.fromARGB(255, 206, 206, 206),

        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo,
          centerTitle: true,
          foregroundColor: Colors.white
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: CircleBorder()
        )
      ),
    );
  }
}