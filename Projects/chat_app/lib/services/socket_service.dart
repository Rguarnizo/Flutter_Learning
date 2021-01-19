import 'package:chat_app/global/environment.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;
  Function get emit => this._socket.emit;

  IO.Socket get socket => _socket;
  ServerStatus get serverStatus => this._serverStatus;

  void connect() async {
    final token = await AuthService.getToken();

    _socket = IO.io(
        Enviroments.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .setExtraHeaders({'x-token': token})
            .build());

    _socket.onConnect((_) {
      print('connect');
      _socket.emit('msg', 'test');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.on('event', (data) => print(data));

    _socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    _socket.on('fromServer', (_) => print(_));

    _socket.on('mensaje', (payload) {
      print('Mensaje: ' + payload['admin']);
    });
  }

  void disconnect() {
    this._socket.disconnect();
  }
}
