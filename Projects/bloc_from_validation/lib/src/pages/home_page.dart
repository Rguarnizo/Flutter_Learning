import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.of(context);
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       Text('Correo: ${bloc.email}'),
       Divider(),
       Text('Password: ${bloc.password}') 
      ],),
    );
  }
}