import 'package:flutter/material.dart';

enum AnimationType{
  normal,
  fadeIn
}

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType? animation;
  final Duration animationDuration;
  final bool replacement;

  RouteTransitions({
    required this.context, 
    required this.child, 
    this.animation = AnimationType.normal,
    this.animationDuration = const Duration(seconds: 1),
    this.replacement = false
  }){

    switch (this.animation) {
      
      case null:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition(this.animationDuration);
        break;
    }


    //
  }

  void _pushPage(Route route) => Navigator.push(context, route);
  void _pushReplacementPage(Route route) => Navigator.pushReplacement(context, route);


  void _normalTransition(){
    final route = MaterialPageRoute(builder: (_) => child);

    if(replacement == true){
        _pushReplacementPage(route);
    }
    else{
        _pushPage(route);
    }
  }

  void _fadeInTransition(Duration duration){
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => this.child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut)
          ),
          child: child,
        );
      }, 
    );

      if(replacement == true){
        _pushReplacementPage(route);
      }
      else{
        _pushPage(route);
      }
  }


}