import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/usuario.dart';
import 'package:practicas_flutter/services/usuario_service.dart';
import 'package:provider/provider.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario ? Text(usuarioService.usuario!.nombre): Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => usuarioService.existeUsuario 
            ? usuarioService.borrarUsuario()
            : null,
            icon: Icon(Icons.delete)
          )
        ],
      ),
      body: usuarioService.existeUsuario ? InformacionUsuario(usuario: usuarioService.usuario!)
      : Center(child: Text('No hay usuario')),

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
          
          if (usuario.profesiones != null)
            //ListTile(title: Text('Profesion1: ')),
            ...usuario.profesiones!.map((e) => ListTile(
              title: Text(e),
            )).toList()
        ],
      ),
    );
  }
}