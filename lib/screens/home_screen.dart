import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search_outlined)
          )
        ],
      ),
        body: Column(
          children: [
            CardSwiper()
            // listado de peliculas
          ],
        )
    );
  }
}