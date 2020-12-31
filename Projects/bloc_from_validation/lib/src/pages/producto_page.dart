import 'package:bloc_from_validation/src/models/producto_model.dart';
import 'package:bloc_from_validation/src/providers/productos_provider.dart';
import 'package:bloc_from_validation/src/providers/productos_provider.dart';
import 'package:bloc_from_validation/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final _formKey = GlobalKey<FormState>();
  final ProductosProvider productosProvider = new ProductosProvider();

  ProductoModel producto = new ProductoModel();

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
                   _crearDisponible(),
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
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'producto'),
      onSaved: (value) => producto.titulo = value,
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
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal:true),
      decoration: InputDecoration(labelText: 'precio',),
      onSaved: (value) => producto.valor = double.parse(value),
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

    if(!_formKey.currentState.validate()) return null;
    _formKey.currentState.save();

    productosProvider.crearProducto(producto);
    
  }

  _crearDisponible() {
    return SwitchListTile(value: producto.disponible, onChanged: (value){
      producto.disponible = value;
      setState(() {
        
      });
    }, 
    title: Text('Disponible'),
    );
  }
}