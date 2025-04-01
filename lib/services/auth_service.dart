
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicas_flutter/global/environment.dart';

class AuthService with ChangeNotifier {

  //final usuario

  //final _baseUrl = Environment.apiUrl;


  Future login(String email, String password) async {
    final data = {
      'email': email,
      'password': password
    };

    //final url = Uri.parse('http://192.168.1.249:3000/api/login');    //192.168.1.249
    final url = Uri.http('10.0.2.2:3000', '/api/login');
    //test1@gmail.com
    final resp = await http.post(url
    );

    print(resp.body);
  }

}