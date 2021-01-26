import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/usuario/usuario_cubit.dart';
import 'package:state_managment/models/usuario.dart';


class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

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

              final user = new Usuario(
                nombre: 'Rubén Darío',
                edad: 34,
                profesiones: [
                  'FullStack Developers',
                  'Video Jugador profesional'
                ]
              );

              usuarioCubit.seleccionarUsuario(user);
              
            },
            color: Colors.blue,
            child: Text('Establecer Usuario'),
          ),
          MaterialButton(
            onPressed: () {
              usuarioCubit.cambiarEdad(30);
            },
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
