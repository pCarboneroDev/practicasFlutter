import 'dart:convert';

class ScanModel {
    int? id;
    String? tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }){
      if (this.valor.contains('http')){
        this.tipo = 'http';
      }
      else{
        this.tipo = 'geo';
      }
    }

    factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
