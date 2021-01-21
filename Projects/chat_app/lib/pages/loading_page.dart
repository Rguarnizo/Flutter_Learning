import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (_,snapshot) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );   
  }

  Future checkLoginState(context)async{
    final authService = Provider.of<AuthService>(context,listen:false);
    final autenticado = await authService.isLoggedIn();
    final socketService = Provider.of<SocketService>(context,listen:false);

    if(autenticado){
      //TODO: Conectar al socket server.
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => UsuariosPage()));
      socketService.connect();
    }else{
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => LoginPage()));
    }    
  }
}