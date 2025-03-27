import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();


  static showSnackbar(String msg){
    final snackBar = SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white, fontSize: 20))
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}