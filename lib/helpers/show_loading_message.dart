import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context){
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) => const AlertDialog(
      title: Text('Espere porfavor.'),
      content: Text('Calculando ruta'),
    ),
  );
  return;
}