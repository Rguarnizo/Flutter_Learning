import 'package:flutter/material.dart';
import 'package:transiciones/pages/pagina1_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Pagina1Page(),
    );
  }
}