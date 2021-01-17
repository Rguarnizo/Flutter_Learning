import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;
  Function get emit => this._socket.emit;

  SocketService( ){
    this._initConfig();
  }

  IO.Socket get socket => _socket;
  ServerStatus get serverStatus => this._serverStatus;

  void _initConfig(){
      _socket = IO.io('https://flutter-socket-server-band.herokuapp.com/',
      IO.OptionBuilder().setTransports(['websocket'])
      .build());

      _socket.connect();

      _socket.onConnect((_){
      print('connect');
      _socket.emit('msg','test');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
      }); 

    _socket.on('event',(data) => print(data));

    _socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    _socket.on('fromServer', (_) => print(_));

    _socket.on('mensaje',(payload){
      print('Mensaje: ' + payload['admin']);
    });
  }





}