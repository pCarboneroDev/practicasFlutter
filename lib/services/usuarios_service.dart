
import 'package:http/http.dart' as http;
import 'package:practicas_flutter/global/environment.dart';

import 'package:practicas_flutter/models/usuario.dart';
import 'package:practicas_flutter/models/usuarios_response.dart';
import 'package:practicas_flutter/services/auth_service.dart';

class UsuariosService {
  final _baseUrl = Environment.apiUrl;

  Future<List<Usuario>> getUsuarios() async {
    
    try{
      final url = Uri.http(_baseUrl, '/api/usuarios');
      final resp = await http.get(url, 
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
        } 
      );

      final usuarios = UsuariosResponse.fromJson(resp.body);

      return usuarios.usuarios;

    }catch(e){
      return [];
    }
  }
}