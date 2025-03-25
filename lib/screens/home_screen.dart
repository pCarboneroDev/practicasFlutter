import 'package:flutter/material.dart';
import 'package:practicas_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Productos App'),
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ProductCard(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}