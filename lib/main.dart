import 'package:flutter/material.dart';
import 'package:practicas_flutter/pages/pagina1_page.dart';
import 'package:practicas_flutter/pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (context) => Pagina1Page(),
        'pagina2': (context) => Pagina2Page(),
      },
    );
  }
}