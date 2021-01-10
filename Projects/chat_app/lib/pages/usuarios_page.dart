import 'package:chat_app/models/usaurio.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key key}) : super(key: key);

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  bool serverConnection;
  final usuarios = [
    Usuario(uid: '1', nombre: 'María', email: 'test1@test.com', online: true),
    Usuario(uid: '1', nombre: 'Ruben', email: 'test1@test.com', online: true),
    Usuario(uid: '1', nombre: 'Juan', email: 'test1@test.com', online: false),
    Usuario(uid: '1', nombre: 'Angel', email: 'test1@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mi nombre',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {},
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
        body: ListView.separated(
            itemBuilder: (_, i) => ListTile(
              title: Text(usuarios[i].nombre),
              leading: CircleAvatar(child: Text(usuarios[i].nombre.substring(0,2)),),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: usuarios[i].online? Colors.green[300] : Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ), 
            separatorBuilder: (_,i) => Divider(), 
            itemCount: usuarios.length));
  }
}
