import 'package:state_managment/pages/models/usuario.dart';

class _UsuarioService{

  Usuario _usuario;


  Usuario get usuario => this._usuario;

  bool get existeUsuario => this._usuario != null? true:false;

  void cargarUsuario(Usuario user){
    this._usuario = user;
  }


}


//? Manera sencilla de crear un Singleton.
final usuarioService = new _UsuarioService();