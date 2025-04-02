import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                
              },
              child: Text('Establecer usuario'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                
              },
              child: Text('Cambiar edad'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                
              },
              child: Text('Añadir profesión'),
            )
          ],
        ),
     ),
   );
  }
}