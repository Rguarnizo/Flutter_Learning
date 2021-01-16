import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'navegacion_page.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animate do'),
          actions: [
            IconButton(icon: FaIcon(FontAwesomeIcons.twitter), onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => TwitterPage()))),
            IconButton(icon: Icon(Icons.navigate_next),onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> NavegacionPage())))
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
   ),
    );
  }
}



class _NotificationModel extends ChangeNotifier{

  int _numero = 0;


  int get numero => this._numero;

  set numero(int numero){
    this._numero = numero;
    notifyListeners();
  }
}