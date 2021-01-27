import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/usuario/usuario_bloc.dart';
import 'package:state_managment/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

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
              final user = Usuario(                
                nombre: 'Ruben Dario',
                edad: 34,
                profesiones: ['FullStack developer']

              );
              usuarioBloc.add(ActivarUsuario(user));
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
