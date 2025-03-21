import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practicas_flutter/src/screens/basic_design.dart';
import 'package:practicas_flutter/src/screens/home_screen.dart';
import 'package:practicas_flutter/src/screens/scroll_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
        'basic_design': (context) => BasicDesignScreen(),
        'scroll_screen': (context) => ScrollScreen(),
        'home_screen': (context) => HomeScreen(),
      },
    );
  }
}
