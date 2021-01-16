import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate do'),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.twitter), onPressed: (){}),
          IconButton(icon: Icon(Icons.navigate_next),onPressed: (){},)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.of(context).push(CupertinoPageRoute(builder: (_)=> Pagina1Page())),
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElasticIn(delay: Duration(milliseconds: 1100),child: Icon(Icons.new_releases)),
          FadeInDown(delay: Duration(milliseconds:200),child: Text('Titulo',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200))),
          FadeInDown(delay: Duration(milliseconds: 800),child: Text('Estoy Pequeño uwu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200))),
          FadeInLeft(delay: Duration(milliseconds: 1100),child: Container(color: Colors.blue,width: 200,height: 4,))
        ],
      ),
     ),
   );
  }
}