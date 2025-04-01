
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicas_flutter/global/environment.dart';
import 'package:practicas_flutter/models/login_response.dart';
import 'package:practicas_flutter/models/usuario.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthService with ChangeNotifier {

  late final Usuario usuario;
  bool _autenticando = false;

  // Create storage
  final _storage = FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  // GETTERS Y SETTER TOKEN STATICOS
  static Future<String> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'Token');
    return token!;
  }

  static Future<void> deleteToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.delete(key: 'Token');
  }

  final _baseUrl = Environment.apiUrl;


  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    //test1@gmail.com
    final url = Uri.http(_baseUrl, '/api/login');
    final resp = await http.post(url, 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    print(resp.body);
    autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body); 
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      return true;
    }
    else{
      return false;
    }
  }

  //registro
  Future<bool> register(String nombre, String email, String password) async {
    this.autenticando = true;

    final data = {
      'nombre': nombre,
      'email': email,
      'password': password
    };

    //test1@gmail.com
    final url = Uri.http(_baseUrl, '/api/login/new');
    final resp = await http.post(url, 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body); 
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      return true;
    }
    else{
      return false;
    }
  }


  Future _guardarToken(String token) async {
    // Write value
    await _storage.write(key: 'token', value: token);
    return;
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

}