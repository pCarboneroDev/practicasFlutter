import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/usuario.dart';
import 'package:practicas_flutter/services/auth_service.dart';
import 'package:practicas_flutter/services/chat_service.dart';
import 'package:practicas_flutter/services/socket_service.dart';
import 'package:practicas_flutter/services/usuarios_service.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final usuariosServce = new UsuariosService();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  List<Usuario> usuarios = [];

  @override
  void initState() {
    _cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final usuario = authService.usuario;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: Text(usuario.nombre),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            socketService.disconnect();
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          },
          icon: Icon(Icons.exit_to_app)
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: socketService.serverStatus == ServerStatus.Online 
            ? Icon(Icons.check_circle, color: Colors.blue[400])
            : Icon(Icons.offline_bolt, color: Colors.red,)
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue,
        ),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
      ),
   );
  }

  ListView _listViewUsuarios() {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) => _usuairoListTile(usuarios[index]),
    );
  }

  ListTile _usuairoListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2))
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),

        onTap: () {
          final chat = Provider.of<ChatService>(context, listen: false);

          chat.usuarioPara = usuario;

          Navigator.pushNamed(context, 'chat');
        }
      );
  }

  _cargarUsuarios() async {
    this.usuarios = await usuariosServce.getUsuarios();

    setState(() {});
    //await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}