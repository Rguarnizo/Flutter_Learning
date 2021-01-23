import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/pages/services/usuarios_service.dart';

import 'models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              usuarioService.usuario = Usuario(nombre: 'Ruben',edad: 20,profesiones: []);
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
