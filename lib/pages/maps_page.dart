import 'package:flutter/material.dart';
import 'package:practicas_flutter/widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {   
    return ScanTiles(tipo: 'geo');
  }
}