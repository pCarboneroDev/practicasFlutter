import 'package:flutter/material.dart';
import 'package:practicas_flutter/routes/routes.dart';
import 'package:practicas_flutter/services/auth_service.dart';
import 'package:practicas_flutter/services/chat_service.dart';
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
          create: (context) => AuthService()
        ),
        ChangeNotifierProvider(
          create: (context) => SocketService()
        ),
        ChangeNotifierProvider(
          create: (context) => ChatService()
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}