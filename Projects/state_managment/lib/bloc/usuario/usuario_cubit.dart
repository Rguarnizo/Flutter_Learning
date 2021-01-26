import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_managment/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{


  UsuarioCubit() : super(UsuarioInitial());


  void seleccionarUsuario(Usuario user){
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad){
    final currentState = state;
    if(currentState is UsuarioActivo){       
      emit(UsuarioActivo(currentState.usuario.copiarUsuario(edad: 30)));
    }
    
  }

  void addProfesion(String prof){
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        prof
      ];
      emit(UsuarioActivo(currentState.usuario.copiarUsuario(profesiones: newProfesiones)));     
    }
  }
  
  void borrarUsuario(){
    emit(UsuarioInitial());
  }

}