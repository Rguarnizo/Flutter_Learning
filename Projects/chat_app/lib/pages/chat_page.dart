import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  final textCtrl = new TextEditingController();
  final focusNode = new FocusNode();

  List<ChatMessage> _message = [
    
  ];

  bool estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 15)),
              backgroundColor: Colors.blueAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Melissa Flores', style: TextStyle(color: Colors.black)),
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
                  if(texto.trim().length >0){
                    estaEscribiendo = true;
                  }else{
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
                          onPressed: estaEscribiendo? ()=> _handleSubmit(textCtrl.text.trim()):null,                          
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ))),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String string) {


    if(string.isEmpty) return;
    
    textCtrl.clear();
    focusNode.requestFocus();



    final newMessage = ChatMessage(uid: '123',texto: string,animationController: AnimationController(vsync: this,duration: Duration(milliseconds: 200)),);
    
    _message.insert(0,newMessage);
    newMessage.animationController.forward();
        setState(() {
      estaEscribiendo = false;
    });

  }

  @override
    void dispose() { 
      for(ChatMessage message in _message){
        message.animationController.dispose();
      } 
      super.dispose();
    }
}
