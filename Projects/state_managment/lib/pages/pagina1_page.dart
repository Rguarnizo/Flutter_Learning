import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/usuario/usuario_cubit.dart';
import 'package:state_managment/models/usuario.dart';



class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
            usuarioCubit.borrarUsuario();
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
      
      body: BodyScaffold(),
   );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit,UsuarioState>(        
      builder: (_, state) {
        
        // switch(state.runtimeType){
        //   case UsuarioInitial: return Center(child: Text('No hay información del usuario'),);
        //     break;
        //   case UsuarioActivo:  return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
        //     break;
        //   default: return Center(child: Text('Estado no reconocido'),);
        // }
        
        if(state is UsuarioInitial) return Center(child: Text('No hay información del usuario'),);
        if(state is UsuarioActivo)  return InformacionUsuario(usuario: state.usuario);
        else                        return Center(child: Text('Estado no reconocido'),);



      },
    );
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

        Text('General',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
        ListTile(title: Text('Nombre: ${usuario.nombre}'),),
        ListTile(title: Text('Edad: ${usuario.edad}'),),
        
        Text('General',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
      ...usuario.profesiones.map((e) => ListTile(title:Text(e)))

      ],),
    );
  }
}