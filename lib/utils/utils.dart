import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

goToUrl(BuildContext context, ScanModel scan) async {

  Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'geo' && Platform.isIOS){  
    final valor = scan.valor.replaceFirst('geo:', ''); // Eliminar 'geo:'
    final partes = valor.split(','); // Separar latitud y longitud

    url = Uri.parse('http://maps.apple.com/?ll=${partes[0]},${partes[1]}');
  }

  if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }

  /*if (scan.tipo == 'http'){
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  else{
    //Navigator.pushNamed(context, 'maps', arguments: scan);

  }*/
}