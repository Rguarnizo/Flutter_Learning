import 'dart:io';

import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final textCtrl = new TextEditingController();
  final focusNode = new FocusNode();

  ChatService chatService;
  SocketService socketService;
  AuthService authService;
  final _message = [];

  bool estaEscribiendo = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);

    socketService.socket.on('mensaje-personal', _escucharMensaje);
    _cargarHistorial(this.chatService.usuarioPara.uid);
  }

  _escucharMensaje(dynamic payload) {
    ChatMessage message = new ChatMessage(
      texto: payload['mensaje'],
      uid: payload['de'],
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 200)),
    );

    _message.insert(0, message);
    message.animationController.forward();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final usuario = chatService.usuarioPara;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              child: Text(usuario.nombre.substring(0, 2),
                  style: TextStyle(fontSize: 15)),
              backgroundColor: Colors.blueAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(usuario.nombre, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => _message[i],
                itemCount: _message.length,
                reverse: true,
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: textCtrl,
              onSubmitted: _handleSubmit,
              onChanged: (String texto) {
                setState(() {
                  if (texto.trim().length > 0) {
                    estaEscribiendo = true;
                  } else {
                    estaEscribiendo = false;
                  }
                });
              },
              decoration: InputDecoration.collapsed(hintText: 'Enviar Mensaje'),
              focusNode: focusNode,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: estaEscribiendo
                              ? () => _handleSubmit(textCtrl.text.trim())
                              : null,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ))),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String string) {
    if (string.isEmpty) return;

    textCtrl.clear();
    focusNode.requestFocus();

    final newMessage = ChatMessage(
      uid: authService.usuario.uid,
      texto: string,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 200)),
    );

    _message.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      estaEscribiendo = false;
    });

    this.socketService.emit('mensaje-personal', {
      'de': this.authService.usuario.uid,
      'para': this.chatService.usuarioPara.uid,
      'mensaje': string,
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _message) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  void _cargarHistorial(String uid) async {
    List<Mensaje> chat = await chatService.getChat(uid);
    
    final history = chat
        .map((e) => ChatMessage(
              texto: e.mensaje,
              uid: e.de,
              animationController: new AnimationController(vsync: this,duration: Duration(milliseconds: 0))..forward(),
            ))
        .toList();


        setState(() {
          _message.insertAll(0,history);
        });
  }
}
