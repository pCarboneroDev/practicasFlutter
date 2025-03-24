import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(

      children: [
        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.pie_chart_outline_sharp, text: 'General'),
            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_crash, text: 'McQueen'),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(color: Colors.purpleAccent, icon: Icons.apple, text: 'Food'),
            _SingleCard(color: Colors.indigoAccent, icon: Icons.light_mode_outlined, text: 'Sunny'),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(color: Colors.deepPurpleAccent, icon: Icons.table_rows, text: 'Rows'),
            _SingleCard(color: Colors.deepOrangeAccent, icon: Icons.track_changes, text: 'Track'),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(color: Colors.greenAccent, icon: Icons.vaccines, text: 'Medicine'),
            _SingleCard(color: Colors.brown, icon: Icons.podcasts, text: 'Radio'),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5, sigmaY: 5
          ),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 30,
                  child: Icon(icon, color: Colors.white, size: 35,),
                ),
                SizedBox(height: 10),
                Text(text, style: TextStyle(color: color, fontSize: 18),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}