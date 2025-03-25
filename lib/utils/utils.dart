import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

goToUrl(BuildContext context, ScanModel scan) async {

  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http'){
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  else{
    Navigator.pushNamed(context, 'maps', arguments: scan);
  }
}