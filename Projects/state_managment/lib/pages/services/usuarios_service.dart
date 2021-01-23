


import 'package:flutter/cupertino.dart';
import 'package:state_managment/pages/models/usuario.dart';

class UsuarioService with ChangeNotifier{

  Usuario _usuario;


  Usuario get usuario => this._usuario;
  bool get existeUsuario => this._usuario != null? true: false;
  


  set usuario(Usuario user){
    this._usuario = user;
    notifyListeners();
    }


  cambiarEdad(int edad){
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario(){
    this._usuario = null;
    notifyListeners();
  }

  void anadirProfesion(String s) {
    this._usuario.profesiones.add(s);
    notifyListeners();
  }

}