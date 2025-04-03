
import 'package:get/get.dart';
import 'package:practicas_flutter/models/usuario.dart';

class UsuarioController extends GetxController {

  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  get profesionesCount {
    return usuario.value.profesiones?.length;
  }


  void cargarUsuario(Usuario usuarioCargar) {
    existeUsuario.value = true;
    usuario.value = usuarioCargar;
  }

  void cambiarEdad(int edad){
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion){
    usuario.update((val) {
      val!.profesiones = [...val.profesiones!, profesion];
    });
  }
}