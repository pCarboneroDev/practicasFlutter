import 'package:flutter/material.dart';
import 'package:practicas_flutter/services/socket_service.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${socketService.serverStatus}')
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TARE
          //emitir: emitir-mensaje
          //{nombre: 'Flutter', mensaje: 'Hola desde Flutter'}
          socketService.socket.emit('emitir-mensaje', {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
        },

        child: Icon(Icons.message),
      ),
    );
  }
}