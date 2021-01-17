import 'dart:convert';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usaurio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

  Usuario usuario;
  bool _autenticando = false;

  bool get autenticando => this._autenticando;
  set autenticando(bool valor){
    this._autenticando = valor;
    notifyListeners();
  }

  Future login(String email, String password) async {


    this.autenticando = true;


    final data = {
      'nombre': 'Rubén Darío',
      'email': email.trim(),
      'password': password.trim(),
    };

    final resp = await http.post('${Enviroments.apiUrl}/login',
        body: jsonEncode(data), 
        headers: {'Content-Type': 'application/json'});

    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
    }

    this.autenticando = false;
  }

  Future createAccount(String email, String password,String name) async {
    final data = {
      'nombre': name,
      'email': email,
      'password': password
    };

    final resp = await http.post('${Enviroments.apiUrl}/login/new',
        body: jsonEncode(data), 
        headers: {'Content-Type': 'application/json'});

    print(resp.body);
  }

}
