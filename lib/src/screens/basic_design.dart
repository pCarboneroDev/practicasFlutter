import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
   
  const BasicDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/landscape.jpg')),
          //SizedBox(height: 20,),
          // Titulo
          Title()
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:30, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Kandesrteg, Switzerland', style: TextStyle(color: Colors.grey))
            ],
          ),

          Expanded(child: Container()),

          Icon(Icons.star, color: Colors.red,),
          Text('41'),
        ],
      ),
    );
  }
}