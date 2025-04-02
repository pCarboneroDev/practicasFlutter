import 'package:flutter/widgets.dart';
import 'package:practicas_flutter/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  List<String>? profesiones;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => _usuario != null ? true : false;

  set usuario(Usuario? us){
    _usuario = us;

    notifyListeners();
  }


  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void borrarUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario!.profesiones!.add('Profesion ${_usuario!.profesiones!.length + 1}');
    notifyListeners();
  }
}