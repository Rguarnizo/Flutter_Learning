import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key key,
    @required this.texto,
    @required this.uid,
    @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: animationController,
        child: SizeTransition(
          sizeFactor: CurvedAnimation(parent: animationController,curve: Curves.easeOut),
          child: Container(
          child: this.uid == '123'?
          _myMessage(): _notMyMessage(),
              ),
        ),
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
