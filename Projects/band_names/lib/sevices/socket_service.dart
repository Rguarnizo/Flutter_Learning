import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService( ){
    this._initConfig();
  }

  get serverStatus => this._serverStatus;

  void _initConfig(){
      IO.Socket socket = IO.io('http://192.168.56.1:3000',
      IO.OptionBuilder().setTransports(['websocket'])
      .build());

      socket.connect();

    socket.onConnect((_){
      print('connect');
      socket.emit('msg','test');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
      }); 

    socket.on('event',(data) => print(data));

    socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    socket.on('fromServer', (_) => print(_));
  }





}