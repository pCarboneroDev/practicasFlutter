import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/usuario.dart';


class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final usuarios = [
    Usuario(uid: '1', nombre: 'Sara', email: 'test1@gmail.com', online: true),
    Usuario(uid: '2', nombre: 'Muñoa', email: 'test2@gmail.com', online: false),
    Usuario(uid: '3', nombre: 'Elena', email: 'test3@gmail.com', online: true),
    Usuario(uid: '4', nombre: 'Juanki', email: 'test4@gmail.com', online: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: Text('Mi Nombre'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.exit_to_app)
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400],),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(usuarios[index].nombre),
          leading: CircleAvatar(
            child: Text(usuarios[index].nombre.substring(0,2))
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuarios[index].online ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        ),
      ),
   );
  }
}