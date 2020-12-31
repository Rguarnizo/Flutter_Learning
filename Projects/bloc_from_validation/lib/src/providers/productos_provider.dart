

import 'dart:convert';

import 'package:bloc_from_validation/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider{

  final String _url = 'https://moviliapp-b94cc.firebaseio.com';


  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/Productos.json';

    final resp = await http.post(url,body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/Productos/${producto.id}.json';

    final resp = await http.put(url,body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
  


  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/Productos.json';

    final resp = await http.get(url);
    
    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<ProductoModel> productos = new List();


    if(decodedData == null) return [];

    decodedData.forEach((id, product) {
      final prodTemp = ProductoModel.fromJson(product);
      prodTemp.id = id;

      productos.add(prodTemp);

    });

    

    return productos;
  }

    Future<int> borrarProducto(String id) async {

    final url = '$_url/Productos/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));


    return 1;

  }

}