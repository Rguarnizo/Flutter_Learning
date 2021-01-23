import 'package:flutter/material.dart';
import 'package:state_managment/pages/models/usuario.dart';
import 'package:state_managment/pages/sevices/usuario_service.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
      
      body: StreamBuilder(
        stream: usuarioService.usuarioStream ,
        
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            child: snapshot.hasData? Center(
              child: InformacionUsuario(snapshot.data)
              ) : Center(child: Text('No hay información de usuario'),),
          );
        },
      ),
   );
  }
}


class InformacionUsuario extends StatelessWidget {
  
  final Usuario usuario;
  
  InformacionUsuario(this.usuario);

  

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
        ListTile(title: Text('Nombre: ${usuario.nombre}'),),
        ListTile(title: Text('Edad: ${usuario.edad}'),),
        
        Text('General',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),

        ListTile(title: Text('Profesion 1'),),
        ListTile(title: Text('Profesion 1'),),
        ListTile(title: Text('Profesion 1'),),

      ],),
    );
  }
}