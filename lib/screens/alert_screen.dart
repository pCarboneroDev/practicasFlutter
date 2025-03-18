import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({super.key});

  void displayDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('ALERTA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('ALERTA CONTENIDO YIA'),
              SizedBox(height: 10),
              FlutterLogo(size: 100,)
            ],
          ),

          actions: [
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
          onPressed: () => displayDialog(context),
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