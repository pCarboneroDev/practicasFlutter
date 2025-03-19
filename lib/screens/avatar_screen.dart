import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piccolo'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('P'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 120,
           backgroundImage: 
           NetworkImage('https://64.media.tumblr.com/70bf4317b7135423a82b727048380016/b37d9b6f6525c846-0d/s640x960/696c835c7676e76a6342b5cf71dcb1a4ad8d0902.jpg'),
         ),
      ),
    );
  }
}