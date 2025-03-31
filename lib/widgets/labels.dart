import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String textoCambioRuta;
  final String textoInfo;

  const Labels({super.key, required this.ruta, required this.textoCambioRuta, required this.textoInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            textoInfo,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, ruta),
            child: Text(
              textoCambioRuta,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
