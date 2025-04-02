import 'package:flutter/material.dart';
import 'package:practicas_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    super.key, 
    required this.texto, 
    required this.uid, 
    required this.animationController
  });

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return FadeTransition(
      opacity: animationController,

      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController, 
          curve: Curves.easeOut
        ),

        child: Container(
        
          child: this.uid == authService.usuario.uid
          ? _myMessage()
          : _notMyMessage()
        ),
      ),
    );
  }


  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,

      child: Container(
        margin: EdgeInsets.only(bottom: 5, left: 50, right: 5),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),

        child: Text(texto, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(
        margin: EdgeInsets.only(bottom: 5, left: 5, right: 50),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),

        child: Text(texto, style: TextStyle(color: Colors.black87)),
      ),
    );
  }
}