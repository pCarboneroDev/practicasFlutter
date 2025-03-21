import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text('Holi'),
            Text('Holi'),
            Text('Holi'),
          ]
        ),

        TableRow(
          children: [
            Text('Holi'),
            Text('Holi'),
            Text('Holi'),
          ]
        ),

        TableRow(
          children: [
            Text('Holi'),
            Text('Holi'),
            Text('Holi'),
          ]
        ),
      ],
    );
  }
}