import 'dart:convert';

import 'package:practicas_flutter/models/usuario.dart';

class LoginResponse {
    bool ok;
    Usuario usuario;
    String token;

    LoginResponse({
        required this.ok,
        required this.usuario,
        required this.token,
    });

    factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "ok": ok,
        "usuario": usuario.toMap(),
        "token": token,
    };
}

