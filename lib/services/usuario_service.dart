import 'dart:async';

import 'package:practicas_flutter/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;

  StreamController<Usuario> _usuariosStreamController = new StreamController<Usuario>.broadcast();

  Usuario get usuario => _usuario!;
  bool get existeUsuario => (_usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuariosStreamController.stream;

  void cargarUsuario(Usuario us){
    _usuario = us;
    _usuariosStreamController.add(us);
  }

  void cambiarEdad (int edad){
    _usuario!.edad = edad;
    _usuariosStreamController.add(_usuario!);
  }


  dispose() {
    _usuariosStreamController.close();
  }
}




final usuarioService = new _UsuarioService();