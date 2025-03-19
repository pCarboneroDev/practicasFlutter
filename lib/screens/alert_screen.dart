import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({super.key});

  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('ALERTA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Aquí está el contenido de la alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100,)
            ],
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Ok")
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cerrar")
            )
          ]
        );
      },
    );
  }

  void displayDialogAndroid (BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text('ALERTA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Aquí está el contenido de la alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100,)
            ],
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Ok")
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cerrar")
            )
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
          //style: ElevatedButton.styleFrom(foregroundColor: Colors.indigo),
          //onPressed: () => displayDialogAndroid(context),
          //onPressed: () => displayDialogIOS(context),
          onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogIOS(context),
          child: const Text('Mostrar alerta')
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close, color: Colors.white,),
        onPressed: (){
          Navigator.pop(context);
        }
      ),
    );
  }
}