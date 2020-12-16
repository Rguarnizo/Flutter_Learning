import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('AvatarPage'),
        actions: [
          Container(
            margin: EdgeInsets.only(right:10.0),
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/ad/29/49/ad2949340e313fbd1c9d12f0c1004bb8.gif'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              
              backgroundColor: Colors.purple,
            ),
          )
        ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage('https://i.pinimg.com/originals/ad/29/49/ad2949340e313fbd1c9d12f0c1004bb8.gif'),
            placeholder: AssetImage('assets/loadinggit.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
          
        ),
      );
  }
}