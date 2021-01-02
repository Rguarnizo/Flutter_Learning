import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:bloc_from_validation/src/models/producto_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: _crearBoton(context),
      body: Container(child: _crearListado(productosBloc)),
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

  _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          
          final productos = snapshot.data;
          print(productos);
          return ListView.builder(
            itemBuilder: (context, i) =>_crearItem(productos[i],context,productosBloc),
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

  _crearItem(ProductoModel producto,context,ProductosBloc productosBloc) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red,),
        onDismissed: (direccion){
          //TODO: Borrar Productos.        
          productosBloc.borrarProducto(producto.id);
        },
        child: Card(
          child: Column(
            children: [
              (producto.fotoUrl == null)? Image(image: AssetImage('assets/no-image.png'),): FadeInImage(placeholder: AssetImage('assets/loading2.gif'), image: NetworkImage(producto.fotoUrl),height: 300,width: double.infinity,),
               ListTile(
                title: Text('${producto.titulo} - ${producto.valor}'),
                subtitle: Text(producto.id),
                onTap: () => Navigator.pushNamed(context,'producto',arguments: producto),
              ),
            ],
          ),
        )
    );

   
  }
}
