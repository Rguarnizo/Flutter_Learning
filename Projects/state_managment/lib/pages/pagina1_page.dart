import 'package:flutter/material.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina 2'),
      ),
      
      body: Center(
        child: InformacionUsuario(),
     ),
   );
  }
}


class InformacionUsuario extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text('General',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
        ListTile(title: Text('Nombre: '),),
        ListTile(title: Text('Edad: '),),
        
        Text('General',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),

        ListTile(title: Text('Profesion 1'),),
        ListTile(title: Text('Profesion 1'),),
        ListTile(title: Text('Profesion 1'),),

      ],),
    );
  }
}