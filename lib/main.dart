import 'package:flutter/material.dart';
import 'package:practicas_flutter/pages/home_page.dart';
import 'package:practicas_flutter/pages/map_page.dart';
import 'package:practicas_flutter/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => new UiProvider(),
        )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'maps': (context) => MapPage()
        },
        theme: ThemeData(
          primaryColor: Colors.red,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)
          ),
        ) 
      ),
    );
  }
}