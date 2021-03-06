import 'package:aplicacion_peliculas/src/pages/home_page.dart';
import 'package:aplicacion_peliculas/src/pages/pelicula_detalle.dart';


import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',    
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/'   : (BuildContext context) => HomePage(),
        'detalle'   : (BuildContext context) => PeliculaDetalle(),
      },
      );    
  }
}