import 'package:state_managment/models/usuario.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';
part 'usuario_events.dart';


class UsuarioBloc extends Bloc<UsuarioEvent,UsuarioState>{
  
  
  
  UsuarioBloc() : super(UsuarioState());

  
  
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async *{
    
    if(event is ActivarUsuario) yield state.copyWith(user: event.usuario ); else
    if(event is CambiarEdad)    yield state.copyWith(user: state.usuario.copyWith(edad: event.edad)); else
    if(event is AnadirProfesion){  state.usuario.profesiones.add(event.profesion); yield state.copyWith(user: state.usuario); } else
    if(event is DeleteUser){    yield state.initState();}
    
    
  }



}