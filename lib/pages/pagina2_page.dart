import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practicas_flutter/models/controllers/usuario_controller.dart';
import 'package:practicas_flutter/models/usuario.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //print(Get.arguments);
    final usuarioCtrl = Get.find<UsuarioController>();

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
                final nuevoUser = Usuario(
                  nombre: 'Sara Ruíz',
                  edad: 23,
                  profesiones: ['Profesora', 'Streamer']
                );
                usuarioCtrl.cargarUsuario(nuevoUser);
                Get.snackbar('Usuario creado', '${nuevoUser.nombre} es el usuario creado',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10
                    )
                  ]
                );
              },
              child: Text('Establecer usuario'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              },
              child: Text('Cambiar edad'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                if (usuarioCtrl.existeUsuario.value)
                  usuarioCtrl.agregarProfesion('Profesión ${usuarioCtrl.profesionesCount + 1}');
              },
              child: Text('Añadir profesión'),
            ),

            MaterialButton(
              color: Colors.blue[100],
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light()
                  : ThemeData.dark());
              },
              child: Text('Cambiar tema'),
            )
          ],
        ),
     ),
   );
  }
}