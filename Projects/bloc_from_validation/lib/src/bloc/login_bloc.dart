

import 'dart:async';

import 'package:bloc_from_validation/src/bloc/validators.dart';

class LoginBloc with Validator{

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  LoginBloc();

  
  
  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }


}