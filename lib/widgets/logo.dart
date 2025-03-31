import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;
  
  const Logo({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 170,
      
        child: SafeArea(
          child: Column(
          
            children: [
              Image(image: AssetImage('assets/tag-logo.png')),
              Text(titulo, style: TextStyle(
                fontSize: 30
              ))
            ],
          ),
        ),
      ),
    );
  }
}
