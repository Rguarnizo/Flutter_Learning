
import 'dart:convert';

import 'package:http/http.dart' as http;


class UsuarioProvider{

  final String _firebaseToken = 'AIzaSyCS3_gFL09KWVBQX1LtIuV2mk_wyEqnmEk';




  Future nuevoUsuario(String email,String password) async {
    
    
    final authData = {
    'email'             : email,
    'password'          : password,
    'returnSecureToken' : true,
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=$_firebaseToken',
      body: json.encode(authData),
    );

    Map <String,dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
  }

}