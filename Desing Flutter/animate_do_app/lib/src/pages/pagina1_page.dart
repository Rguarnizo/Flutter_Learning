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
        onPressed: (){},
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.new_releases),
          Text('Titulo',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200)),
          Text('Estoy Pequeño uwu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200)),
          Container(color: Colors.blue,width: 200,height: 4,)
        ],
      ),
     ),
   );
  }
}