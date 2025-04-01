import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicas_flutter/widgets/chat_message.dart';


class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

final _textController = TextEditingController();
final _focusNode = FocusNode();

List<ChatMessage> _messages = [
 
];

bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text('Te', style: TextStyle(fontSize: 15)),
                backgroundColor: Colors.blue[100],
                maxRadius: 19,
              ),
            ),

            Text('Sara Ruiz', style: TextStyle(color: Colors.black87, fontSize: 15),)

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
      uid: '123',
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)),
    );

    _messages.insert(0,newMessage);

    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
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