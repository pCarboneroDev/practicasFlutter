import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify Transaction',
            style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white)),

            SizedBox(height: 10),

            Text('Classify this transaction into a particular cateogry',
            style: TextStyle(fontSize: 16,
              color: Colors.white)),
          ],
        ),
      ),
    );
  }
}