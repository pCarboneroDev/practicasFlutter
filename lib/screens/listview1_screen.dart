import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final options = const ['Bayonetta', 'TES V: Skyrim', 'TES IV: Oblivion', 'TES III: Morrowind'];
   
  const ListView1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
        title: const Text('ListView 1', style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        children: [
          ...options.map(
            (game) => ListTile(
              leading: const Icon(Icons.gamepad),
              title: Text(game),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            )
          )
        ],
      )
    );
  }
}