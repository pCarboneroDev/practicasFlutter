import 'package:flutter/material.dart';
import 'package:practicas_flutter/global/environment.dart';
import 'package:practicas_flutter/models/mensajes_response.dart';
import 'package:practicas_flutter/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:practicas_flutter/services/auth_service.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;


  Future<List<Mensaje>> getChat(String usuarioId) async {
    List<Mensaje> mensajes = [];

    final url = Uri.http(Environment.apiUrl, '/api/mensajes/$usuarioId');
    final resp = await http.get(url, 
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      }
    );

    if (resp.statusCode == 200){
      final mensajesResponse = MensajesResponse.fromJson(resp.body);   
      mensajes = mensajesResponse.mensajes;
    }

    return mensajes;
  }
}