import 'package:bloc_from_validation/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  ProductoPage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
               key: _formKey,
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
      validator: (value){
        if(value.length < 3){
          return 'Ingrese el nombre del producto';
        }else {
          return null;
        }
      },
    );
  }

  _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal:true),
      decoration: InputDecoration(labelText: 'precio',),
      validator: (value){
        if(isNumeric(value)){
          return null;
        }else{
          return 'Ingrese un numero valido';
        }
      },
    );
  }

  _crearBoton() {
    return RaisedButton.icon(icon: Icon(Icons.save),onPressed: (){
      _submit();
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    color: Colors.deepPurple,
    textColor: Colors.white,
    label: Text('Guardar'),
    );
  }

  void _submit(){
    _formKey.currentState.validate();
  }
}