import 'package:chat_app/models/usaurio.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/services/usuarios_service.dart';
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
  final usuarioService = UsuariosService();
  List<Usuario> usuarios = [];

  bool serverConnection;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cargarUsuarios();
  }
  

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
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
              socketService.disconnect();
              AuthService.delateToken();

            },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: socketService.serverStatus == ServerStatus.Online
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
      onTap: (){

        final chatService = Provider.of<ChatService>(context,listen: false);
        chatService.usuarioPara = usuario;

        Navigator.pushNamed(context,'chat');
      } ,
    );
  }

  _cargarUsuarios() async{
    

    this.usuarios =  await usuarioService.getUsuarios();
    setState(() {
      
    });
    refrshCtrl.refreshCompleted();


  }
}
