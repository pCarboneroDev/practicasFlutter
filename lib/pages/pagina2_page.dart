import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/usuario.dart';
import 'package:practicas_flutter/services/usuario_service.dart';


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
                final user = new Usuario(
                  nombre: 'Sara', 
                  edad: 23
                );
                usuarioService.cargarUsuario(user);
              },
              child: Text('Establecer usuario'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                usuarioService.cambiarEdad(25);
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