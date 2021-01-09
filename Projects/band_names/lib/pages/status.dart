import 'package:band_names/sevices/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        socketService.socket.emit('mensaje',{'nombre': 'Ruben','apellido':'Martínez'});
      },child: Icon(Icons.message),),
      body: Center(        
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Server Status: ${socketService.serverStatus}'),
        ],
      ),),
    );
  }
}