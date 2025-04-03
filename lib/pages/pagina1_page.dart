import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:practicas_flutter/models/controllers/usuario_controller.dart';
import 'package:practicas_flutter/models/usuario.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
      ),
      body: Obx( () => usuarioCtrl.existeUsuario.value ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,) 
        : Center(child: Text('No hay usuario seleccionado'))
      ),
     floatingActionButton: FloatingActionButton(
      //onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      onPressed: () => Get.toNamed('pagina2', arguments: {
        'nombre':'Fernando',
        'edad':35
      }),
      child: Icon(Icons.accessibility_new),
      ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({
    super.key, required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
          ),),

          Divider(),

          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),

          Text('Profesiones', style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
          ),),

          Divider(),

          ...usuario.profesiones!.map(
            (profesion) => ListTile(
              title: Text(profesion),
            )
          )
        ],
      ),
    );
  }
}