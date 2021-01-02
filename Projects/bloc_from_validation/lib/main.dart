import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:bloc_from_validation/src/pages/home_page.dart';
import 'package:bloc_from_validation/src/pages/login_page.dart';
import 'package:bloc_from_validation/src/pages/producto_page.dart';
import 'package:bloc_from_validation/src/pages/registro_page.dart';
import 'package:bloc_from_validation/src/providers/shered_preferences.dart';
import 'package:flutter/material.dart';
 

void main()async{
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  PreferenciasUsuario _prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    print(_prefs.token);

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