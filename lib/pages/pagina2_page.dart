import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/bloc/user/user_bloc.dart';
import 'package:practicas_flutter/models/usuario.dart';


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
                final usuario = Usuario(
                  nombre: 'Sara Ruíz', 
                  edad: 23, 
                  profesiones: ['Profesora', 'Streamer']
                );
                BlocProvider.of<UserBloc>(context, listen: false)
                  .add(ActivateUser(usuario));
              },
              child: Text('Establecer usuario'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                  .add(CambiarEdad(25));
              },
              child: Text('Cambiar edad'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                  .add(AgregarProfesion('Nueva profesion'));
              },
              child: Text('Añadir profesión'),
            )
          ],
        ),
     ),
   );
  }
}