import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/pages/services/usuarios_service.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
      
      body:usuarioService.existeUsuario? Center(
        child: InformacionUsuario(),
     ): Center(child: Text('No hay Información del usuario'),)
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