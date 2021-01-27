import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/usuario/usuario_bloc.dart';
import 'package:state_managment/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina1'),
          actions: [
            IconButton(icon: Icon(Icons.delete),onPressed: (){
              userBloc.add(DeleteUser());
            },)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        ),
        body: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (context, state) {
            if (state.existeUsuario) {
              return Center(
                child: InformacionUsuario(usuario: state.usuario),
              );
            }else{
              return Center(child: Text('No hay un usuario seleccionado'),);
            }
          },
        ));
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({Key key, this.usuario}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones.map((e) => ListTile(title: Text(e),)),
        ],
      ),
    );
  }
}
