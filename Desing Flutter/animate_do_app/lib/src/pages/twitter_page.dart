import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TwitterPage extends StatefulWidget {

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {

  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){setState(() {
        activar = true;
      });},backgroundColor: Colors.pink,child: FaIcon(FontAwesomeIcons.play),),
      backgroundColor: Color(0xff1DA1F2),
      body: Center(        
        child: ZoomIn(animate: activar,child: FaIcon(FontAwesomeIcons.twitch,color:Colors.white,size: 40,))
     ),
   );
  }
}