import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle; //? Necesario para leer Json


class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    
  }

  Future<List<dynamic>> cargarData() async{

    final data = await rootBundle.loadString('data/menu-opts.json');
      
      Map dataMap = json.decode(data);
      opciones = dataMap['rutas'];

      return opciones;
  }

}

final menuProvider = new _MenuProvider();