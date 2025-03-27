import 'package:flutter/material.dart';
import 'package:practicas_flutter/services/services.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductService()),
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MyApp(),
    );
  }
}

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
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreen(),
        'register': (_) => RegisterScreen(),
        'checking': (_) => CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
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