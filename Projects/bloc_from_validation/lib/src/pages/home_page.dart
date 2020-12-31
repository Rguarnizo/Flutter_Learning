import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:bloc_from_validation/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({Key key}) : super(key: key);

  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      floatingActionButton: _crearBoton(context),
      body: SingleChildScrollView(child: _crearListado()),
    );
  }

  _crearBoton(context) {
    return FloatingActionButton(onPressed: (){Navigator.pushNamed(context, 'producto');},child: Icon(Icons.add,color: Colors.deepPurple),);
  }

  _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Container();
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}