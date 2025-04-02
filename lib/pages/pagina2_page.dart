import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/usuario.dart';
import 'package:practicas_flutter/services/usuario_service.dart';
import 'package:provider/provider.dart';

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
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.usuario = new Usuario(
                  nombre: 'Sara Ruiz', 
                  edad: 23,
                  profesiones: [
                    "Profesora", "Intérprete"
                  ]
                );
              },
              child: Text('Establecer usuario'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                
                if (usuarioService.existeUsuario){
                  usuarioService.cambiarEdad(25);
                }
              },
              child: Text('Cambiar edad'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.agregarProfesion();                
              },
              child: Text('Añadir profesión'),
            )
          ],
        ),
     ),
   );
  }
}