import 'package:flutter/material.dart';
import 'package:practicas_flutter/helpers/route_transitions.dart';
import 'package:practicas_flutter/pages/page2.dart';


class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          color: Colors.white,
          onPressed: () {
            //Navigator.pushNamed(context, 'page2');
            RouteTransitions(
              context: context, 
              child: Page2(),
              animation: AnimationType.fadeIn,
              animationDuration: Duration(milliseconds: 100)
            );
          },
          child: Text('Go to page2'),
        )
     ),
   );
  }
}

class RouteTransition {
}