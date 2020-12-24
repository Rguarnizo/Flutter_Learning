import 'package:flutter/material.dart';

import 'package:qr_reader/src/pages/home_page.dart';
import 'package:qr_reader/src/pages/mapa_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader.',
      routes: {
        'Home': (BuildContext context)=> HomePage(),
        'Mapa': (BuildContext context)=> MapaPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      initialRoute: 'Home',
    );
  }
}