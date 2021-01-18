import 'dart:convert';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usaurio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

  Usuario usuario;
  bool _autenticando = false;
  final _storage = FlutterSecureStorage();

  bool get autenticando => this._autenticando;
  set autenticando(bool valor){
    this._autenticando = valor;
    notifyListeners();
  }

  //!Gets Sets Static Token
  static Future<String> getToken() async{
    final _storage = FlutterSecureStorage();
    final token =  await _storage.read(key: 'token');
    return token;
  }
  static delateToken() async{
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');    
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
    
    
    this.autenticando = false;


    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    }
      return false;
    
  }

  Future createAccount(String email, String password,String name) async {

    autenticando = true;

    final data = {
      'nombre': name,
      'email': email,
      'password': password
    };

    final resp = await http.post('${Enviroments.apiUrl}/login/new',
        body: jsonEncode(data), 
        headers: {'Content-Type': 'application/json'});

    autenticando = false;
    print(resp.body);
    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    }
      return false;
  }

  Future _guardarToken(String token) async{
    return await _storage.write(key: 'token', value: token);
  }


  Future logOut() async{
    await _storage.delete(key: 'token');
  }


}
