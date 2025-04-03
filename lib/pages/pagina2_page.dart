import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/bloc/usuario/usuario_cubit.dart';
import 'package:practicas_flutter/models/usuario.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
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
                final newUsuario = new Usuario(
                  nombre: 'Sara Ruiz', 
                  edad: 23, 
                  profesiones: [
                    'Profesora', 'Videojugadora', 'Streamer'
                  ]
                );
                usuarioCubit.seleccionarUsuario(newUsuario);
              },
              child: Text('Establecer usuario'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                usuarioCubit.cambiarEdad(25);
              },
              child: Text('Cambiar edad'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
              child: Text('Añadir profesión'),
            )
          ],
        ),
     ),
   );
  }
}