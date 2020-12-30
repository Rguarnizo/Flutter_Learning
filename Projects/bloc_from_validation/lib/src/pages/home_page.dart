import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      floatingActionButton: _crearBoton(context),
      body: SingleChildScrollView(child: Container()),
    );
  }

  _crearBoton(context) {
    return FloatingActionButton(onPressed: (){Navigator.pushNamed(context, 'producto');},child: Icon(Icons.add,color: Colors.deepPurple),);
  }
}