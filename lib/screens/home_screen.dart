
import 'package:flutter/material.dart';
import 'package:practicas_flutter/screens/counter_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text('HOME SCREEN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), 
        elevation: 0.0,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        spacing: 500,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add_circle, color: Colors.white,),
            onPressed: () 
            { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounterScreen()),
            ); }
            ),

            FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add_circle, color: Colors.white,),
            onPressed: () 
            { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounterScreen()),
            ); }
            ),
        ],
      ),
    );
  }

}