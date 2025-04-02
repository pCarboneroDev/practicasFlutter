import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/mensajes_response.dart';
import 'package:practicas_flutter/services/auth_service.dart';
import 'package:practicas_flutter/services/chat_service.dart';
import 'package:practicas_flutter/services/socket_service.dart';
import 'package:practicas_flutter/widgets/chat_message.dart';
import 'package:provider/provider.dart';


class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

final _textController = TextEditingController();
final _focusNode = FocusNode();

late ChatService chatService;
late SocketService socketService;
late AuthService authService;

List<ChatMessage> _messages = [
 
];

bool _estaEscribiendo = false;

@override
  void initState() {
    super.initState();

    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);

    this.socketService.socket.on('mensaje-personal', (data)=>_escucharMensaje(data));

    _cargarHistorial(chatService.usuarioPara.uid);
  }

  void _cargarHistorial(String usuarioId) async {
    List<Mensaje> chat = await chatService.getChat(usuarioId);

    final history = chat.map((m) => new ChatMessage(
      texto: m.mensaje, 
      uid: m.de, 
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 0))..forward()
    ));

    setState(() {
      _messages.insertAll(0, history);
    });
  }

  void _escucharMensaje(dynamic payload){
    print(payload);

    ChatMessage msg = ChatMessage(
      texto: payload['mensaje'], 
      uid: payload['de'], 
      animationController: AnimationController(vsync: this,
      duration: Duration(milliseconds: 300))
    );

    setState(() {
      _messages.insert(0, msg);

      msg.animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final usuario = chatService.usuarioPara;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text(usuario.nombre.substring(0,2), style: TextStyle(fontSize: 15)),
                backgroundColor: Colors.blue[100],
                maxRadius: 19,
              ),
            ),

            Text(usuario.nombre, style: TextStyle(color: Colors.black87, fontSize: 15),)

          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => _messages[index],
                reverse: true,
              )
            ),

            Divider(height: 1),

            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      )
   );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),

        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty){
                      _estaEscribiendo = true;
                    }
                    else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              )
            ),

            // boton de enviar

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS 
              ? CupertinoButton(
                child: Text('Enviar'), 
                onPressed: _estaEscribiendo 
                    ? () => _handleSubmit(_textController.text)
                    : null,
              )
              : Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),

                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: _estaEscribiendo 
                    ? () => _handleSubmit(_textController.text)
                    : null, 
                    icon: Icon(Icons.send)
                  ),
                ),
              )
            )

          ],
        ),
      )
    );
  }


  _handleSubmit(String texto){

    if (texto.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      texto: texto, 
      uid: authService.usuario.uid,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)),
    );

    _messages.insert(0,newMessage);

    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });

    socketService.emit('mensaje-personal', {
      'de': authService.usuario.uid,
      'para': chatService.usuarioPara.uid,
      'mensaje': texto
    });
  }

  @override
  void dispose() {
    // TODO limpiar off del socket

    for(ChatMessage m in _messages){
      m.animationController.dispose();
    }
  
    super.dispose();
  }
}