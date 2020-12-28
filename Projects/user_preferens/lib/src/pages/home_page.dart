import 'package:flutter/material.dart';
import 'package:user_preferens/src/shere_prefs/user_prefs.dart';
import 'package:user_preferens/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  static final String routeName = 'Home';

  final PreferenciasUsuario prefs = PreferenciasUsuario();

  /// Commit de urgenciaaa!

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(title: Text('Preferencias de usuario.'),),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('Color secundario: ${prefs.colorSecundario}'),
         Divider(),
         Text('Género: '),
         Divider(),
         Text('Color secundario: '),
         Divider(),
         Text('Nombre usuario: '),
       ], 
      ),
    );
  }

}