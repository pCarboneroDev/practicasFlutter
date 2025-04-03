import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/bloc/usuario/usuario_cubit.dart';
import 'package:practicas_flutter/models/usuario.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
            icon: Icon(Icons.delete)
          )
        ],
        title: Text('Pagina 1'),
        centerTitle: true,
      ),
      body: BodyScaffold(),
     floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      child: Icon(Icons.accessibility_new),
      ),
   );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {

        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay información del usuario'));
          break;

          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          break;

          default: return Text('waos');
        }
        /*if (state is UsuarioInitial){
          return Center(child: Text('No hay información del usuario'));
        }
        else if(state is UsuarioActivo){ 
          return InformacionUsuario(usuario: state.usuario);
        }
        return Text('waos');*/


      },
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

          ...usuario.profesiones.map(
            (profesion) => ListTile(
              title: Text('${profesion}'),
            )
          )
        ],
      ),
    );
  }
}