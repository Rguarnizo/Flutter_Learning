import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/usaurio.dart';

class UsuariosService {







  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Enviroments.apiUrl}/usuarios', headers: {
        'x-token': await AuthService.getToken(),
        'Content-Type': 'application/json'
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);


      return usuariosResponse.usuarios;

    } catch (e) {
      print(e);
      return [];
    }
  }
}
