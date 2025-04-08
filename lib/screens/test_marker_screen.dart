import 'package:flutter/material.dart';
import 'package:practicas_flutter/markers/end_marker.dart';
import 'package:practicas_flutter/markers/start_marker.dart';

class TestMarkerScreen extends StatelessWidget {
   
  const TestMarkerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Container(
          color: Colors.red,
          width: 350,
          height: 150,

          child: CustomPaint(
            painter: EndMarkerPainter(kilometers: 59, destination:"Antiguo Matadero Municipal"),
          ),
         ),
      ),
    );
  }
}