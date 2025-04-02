import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/usuario.dart';
import 'package:practicas_flutter/services/usuario_service.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream, 
          builder: (context, snapshot) {
            return snapshot.hasData ? Text(usuarioService.usuario.nombre) : Text('Pagina2');
          },
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream, 
        builder: (context, AsyncSnapshot<Usuario> snapshot) {
          if (snapshot.hasData){
            return InformacionUsuario(usuario: usuarioService.usuario); 
          }
          else{
            return Center(child: Text('No hay información del usuario'));
          }
        },
      ),
     floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'pagina2'),
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

          ListTile(title: Text('Profesion1: ')),
          ListTile(title: Text('Profesion1: ')),
          ListTile(title: Text('Profesion1: ')),
          ListTile(title: Text('Profesion1: ')),
        ],
      ),
    );
  }
}