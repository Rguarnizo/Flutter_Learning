

import 'dart:convert';

import 'package:bloc_from_validation/src/models/producto_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';

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


  Future<String> subirImagen(PickedFile image) async{

    final url = Uri.parse('https://api.cloudinary.com/v1_1/ruben-cloud/image/upload?upload_preset=bazaejgm');
    final mimeType = mime(image.path).split('/');
     

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath('file', image.path,contentType: MediaType(mimeType[0],mimeType[1]));


    imageUploadRequest.files.add(file);


    final streamResponde = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponde);

    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);

    print(respData);

    return respData['secure_url'];

  }

}