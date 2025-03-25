import 'package:flutter/material.dart';
import 'package:practicas_flutter/widgets/scan_tiles.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}