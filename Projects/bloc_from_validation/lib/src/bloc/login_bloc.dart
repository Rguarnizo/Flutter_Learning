

import 'dart:async';

import 'package:bloc_from_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  Stream<bool> get formValidStream => CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);
  
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  LoginBloc();


  //Obtener Ultimo Valor ingresado en los streams

  String get email => _emailController.value;
  String get password => _passwordController.value;

  
  
  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }


}