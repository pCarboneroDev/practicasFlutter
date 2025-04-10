import 'package:flutter/material.dart';
import 'package:practicas_flutter/pages/page1.dart';
import 'package:practicas_flutter/pages/page2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (context) => Page1(),
        'page2': (context) => Page2(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 1
        )
      ),
    );
  }
}