import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


mostrarALerta(BuildContext context, String titulo, String subtitulo){
  if (Platform.isAndroid){
    return showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(titulo),
            content: Text(subtitulo),
            actions: [
              MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          ),
        );
  }

  showCupertinoDialog(
    context: context, 
    builder: (context) => CupertinoAlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: Text('Ok')
        )
      ],
    ),
    );
    
}