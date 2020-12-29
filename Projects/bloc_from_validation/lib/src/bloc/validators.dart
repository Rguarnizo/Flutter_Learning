

import 'dart:async';

class Validator{

   final validarEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      Pattern pattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
      RegExp regExp = new RegExp(pattern);
      
      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('El email no es correcto');
      }

    }
  );



  final validarPassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){

      if(password.length >= 6){
        sink.add(password);
      }else{
        sink.addError('La constraseña es muy corta.');
      }
    }
  );








}