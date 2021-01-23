import 'package:flutter/material.dart';
import 'package:state_managment/pages/sevices/usuario_service.dart';

import 'models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Usuario>(
          stream: usuarioService.usuarioStream,
          builder: (context, snapshot) {
            return snapshot.hasData? Text(snapshot.data.nombre):Text('Pagina2');
          }
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              usuarioService.cargarUsuario(Usuario(
                  nombre: 'Ruben',
                  edad: 15,
                  profesiones: [
                    'Developer',
                    'DB Magnagment',
                    'Software Architect'
                  ]));
            },
            color: Colors.blue,
            child: Text('Establecer Usuario'),
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            child: Text('Establecer Edad'),
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            child: Text('Añadir Profesion'),
          ),
        ],
      )),
    );
  }
}
