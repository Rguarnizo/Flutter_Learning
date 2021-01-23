import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/pages/pagina1_page.dart';
import 'package:state_managment/pages/pagina2_page.dart';
import 'package:state_managment/pages/services/usuarios_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService()),

      ],
      child: MaterialApp(
        
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'pagina1',
        routes: {
          'pagina1' : (_) => Pagina1Page(),
          'pagina2' : (_) => Pagina2Page(),
        },
      ),
    );
  }
}