part of 'usuario_bloc.dart';

class UsuarioState {
  final bool existeUsuario;
  final Usuario usuario;

  UsuarioState({ Usuario user})
  : usuario = user?? null
  , existeUsuario = user != null? true:false;



  UsuarioState copyWith({Usuario user}) => UsuarioState(
    user: user?? this.usuario,
  );

  UsuarioState initState() => UsuarioState();
}
