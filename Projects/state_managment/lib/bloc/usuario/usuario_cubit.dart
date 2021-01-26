


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_managment/pages/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{


  UsuarioCubit() : super(UsuarioInitial());


  void seleccionarUsuario(Usuario user){
    emit(new UsuarioActivo(user));
  }

}