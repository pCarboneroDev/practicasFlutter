import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/pages/tabs_page.dart';
import 'package:practicas_flutter/src/services/news_service.dart';
import 'package:practicas_flutter/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new NewsService())
      ],

      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage()
      ),
    );
  }
}