import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
   
  const LoadingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos App'),
      ),
      body: Center(
         child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}