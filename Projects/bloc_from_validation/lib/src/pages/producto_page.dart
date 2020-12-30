import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(icon: Icon(Icons.photo_size_select_actual), onPressed: (){}),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: (){}),
        ],
      ),
      body: Container(
         child: SingleChildScrollView(           
           child: Container(
             padding: EdgeInsets.all(15),
             child: Form(
               child: Column(
                 children: [
                   _crearNombre(),
                   _crearPrecio(),
                   _crearBoton(),
                 ],
               ),
             ),
           )
         ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'producto'),
    );
  }

  _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal:true),
      decoration: InputDecoration(labelText: 'precio',),
    );
  }

  _crearBoton() {
    return RaisedButton.icon(icon: Icon(Icons.save),onPressed: (){

    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    color: Colors.deepPurple,
    textColor: Colors.white,
    label: Text('Guardar'),
    );

  }
}