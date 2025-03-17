
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
      title: const Text(
        'HOME SCREEN',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
    ),
    body: Column(
      children: [
        Align(
          alignment: Alignment.center, 
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Ir al contador',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    ),
  );
}

}