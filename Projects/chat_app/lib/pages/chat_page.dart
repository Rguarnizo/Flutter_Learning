import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textCtrl = new TextEditingController();
  final focusNode = new FocusNode();

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
                itemBuilder: (_, i) => Text('$i'),
                itemCount: 50,
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
    print(string);
    textCtrl.clear();
    focusNode.requestFocus();

    setState(() {
      estaEscribiendo = false;
    });
  }
}
