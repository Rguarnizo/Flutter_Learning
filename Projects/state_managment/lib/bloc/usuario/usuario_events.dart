
part of 'usuario_bloc.dart';


@immutable
abstract class UsuarioEvent{
}

class ActivarUsuario extends UsuarioEvent{

  final Usuario usuario;

  ActivarUsuario(this.usuario);

}


class CambiarEdad extends UsuarioEvent{

  final int edad;

  CambiarEdad(this.edad);


}

class AnadirProfesion extends UsuarioEvent{

  final String profesion;

  AnadirProfesion(this.profesion);

}

class DeleteUser extends UsuarioEvent{
  
  DeleteUser();
  
}