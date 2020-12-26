import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'Home';

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(title: Text('Preferencias de usuario.'),),
      body: Column(
       children: [
         Text('Color secundario: '),
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