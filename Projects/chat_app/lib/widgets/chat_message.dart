import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;

  const ChatMessage({
    Key key,
    this.texto,
    this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123'?
      _myMessage(): _notMyMessage(),
          );
        }
      
  _myMessage() {
    return Align(
      
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        padding: EdgeInsets.all(8.0),
        child: Text(this.texto,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
        decoration: BoxDecoration(
          color:  Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
  

  _notMyMessage() {
   return Align(
      
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        padding: EdgeInsets.all(8.0),
        child: Text(this.texto,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
        decoration: BoxDecoration(
          color:  Colors.grey[300],
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
