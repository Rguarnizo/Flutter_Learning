import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:bloc_from_validation/src/pages/home_page.dart';
import 'package:bloc_from_validation/src/pages/login_page.dart';
import 'package:bloc_from_validation/src/pages/producto_page.dart';
import 'package:bloc_from_validation/src/pages/registro_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
        title: 'Material App',
        initialRoute: 'login',
        debugShowCheckedModeBanner: false,
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
          'registro': (BuildContext context) => RegistroPage(),
        },
      ),
    );
  }
}