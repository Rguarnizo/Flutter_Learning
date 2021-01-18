import 'package:chat_app/models/usaurio.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key key}) : super(key: key);

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController refrshCtrl = RefreshController(initialRefresh: false);

  bool serverConnection;
  final usuarios = [
    Usuario(uid: '1', nombre: 'María', email: 'test1@test.com', online: true),
    Usuario(uid: '1', nombre: 'Ruben', email: 'test1@test.com', online: true),
    Usuario(uid: '1', nombre: 'Juan', email: 'test1@test.com', online: false),
    Usuario(uid: '1', nombre: 'Angel', email: 'test1@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            usuario.nombre,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              //TODO: Desconectarnos del socket server.              
              Navigator.pushReplacementNamed(context, 'login');
              AuthService.delateToken();
            },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: true
                  ? Icon(Icons.check_circle, color: Colors.blue)
                  : Icon(Icons.bolt, color: Colors.red),
            )
          ],
        ),
        body: SmartRefresher(
          child: _listViewUsuarios(),
          onRefresh: _cargarUsuarios,
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(Icons.check,color: Colors.blue[400],),
            waterDropColor: Colors.blue,
          ),
          controller: refrshCtrl,
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _cargarUsuarios() async{
    await Future.delayed(Duration(microseconds: 1000));
    refrshCtrl.refreshCompleted();
  }
}
