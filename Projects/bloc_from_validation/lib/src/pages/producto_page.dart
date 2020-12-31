

import 'package:bloc_from_validation/src/models/producto_model.dart';
import 'package:bloc_from_validation/src/providers/productos_provider.dart';
import 'package:bloc_from_validation/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductosProvider productosProvider = new ProductosProvider();


  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  PickedFile foto;

  @override
  Widget build(BuildContext context) {

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if(prodData != null) producto = prodData;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(icon: Icon(Icons.photo_size_select_actual), onPressed: _seleccionarFoto),
                    IconButton(icon: Icon(Icons.camera_alt), onPressed: _tomarfoto),
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
                             _mostrarFoto(),
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
              return RaisedButton.icon(icon: Icon(Icons.save),onPressed: _guardando? null: (){
                _submit();
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              color: Colors.deepPurple,
              textColor: Colors.white,
              label: Text('Guardar'),
              );
            }
          
            void _submit() async {
          
              if(!_formKey.currentState.validate()) return null;
              _formKey.currentState.save();
              
              _guardando = true;
              setState(() {
                
              });

              if(foto != null){
                producto.fotoUrl = await productosProvider.subirImagen(foto);
              }
          
              if(producto.id == null) productosProvider.crearProducto(producto); 
          
              else                    productosProvider.editarProducto(producto);
          
              _guardando = false;
          
              snackBar('Registro Guardado con exito');    
          
              Navigator.pop(context);
              
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
          
            void snackBar(String message){
              final snackBar = SnackBar(content: Text(message),duration: Duration(milliseconds: 1500),);
          
              _scaffoldKey.currentState.showSnackBar(snackBar);
            }

            _mostrarFoto(){
              if(producto.fotoUrl != null){
                return Container();
              }else{
                return Image(image: AssetImage(foto?.path?? 'assets/no-image.png'),);
              }
            }
          
          
             _seleccionarFoto() async{
              foto = (await ImagePicker.platform.pickImage(source: ImageSource.gallery));

               if(foto != null){
                 //limpieza
               }

               setState(() { 
                 
               });
            }

            _tomarfoto() async{
              foto = (await ImagePicker.platform.pickImage(source: ImageSource.camera));

               if(foto != null){
                 //limpieza
               }

               setState(() { 
                 
               });

            }
}