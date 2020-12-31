import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:bloc_from_validation/src/models/producto_model.dart';
import 'package:bloc_from_validation/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: _crearBoton(context),
      body: Container(child: _crearListado()),
    );
  }

  _crearBoton(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, 'producto');
      },
      child: Icon(Icons.add, color: Colors.deepPurple),
    );
  }

  _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          
          final productos = snapshot.data;
          print(productos);
          return ListView.builder(
            itemBuilder: (context, i) =>_crearItem(productos[i],context),
            itemCount: productos.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _crearItem(ProductoModel producto,context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red,),
        onDismissed: (direccion){
          //TODO: Borrar Productos.          
        },
        child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: () => Navigator.pushNamed(context,''),
      ),
    );
  }
}
