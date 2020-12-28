import 'package:flutter/material.dart';
import 'package:user_preferens/src/pages/home_page.dart';
import 'package:user_preferens/src/pages/setting_page.dart';
import 'package:user_preferens/src/shere_prefs/user_prefs.dart';
 
void main()async{ 
  
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();


  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    return MaterialApp(
      title: 'Material App',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName    : (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}