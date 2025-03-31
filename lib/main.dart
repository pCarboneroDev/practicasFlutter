import 'package:flutter/material.dart';
import 'package:practicas_flutter/pages/home.dart';
import 'package:practicas_flutter/pages/status.dart';
import 'package:practicas_flutter/services/socket_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SocketService()
        )
      ],

      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'status': (_)=> StatusPage()
        },
      ),
    );
  }
}