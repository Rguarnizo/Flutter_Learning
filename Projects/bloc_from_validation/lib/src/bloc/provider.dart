import 'package:bloc_from_validation/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{

  final LoginBloc loginBloc = LoginBloc();

  Provider({Key key, Widget child}):super(key: key,child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType(aspect: Provider) as Provider).loginBloc;
  }








  
}