
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const fontSize35 = const TextStyle(fontSize: 35);
    int clicks = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text('HOME SCREEN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), 
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            const Text('Contador de clicks:', style: fontSize35),
            Text('$clicks', style: TextStyle(fontSize: 45))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: () { clicks++; print(clicks); }
        ),
    );
  }

}