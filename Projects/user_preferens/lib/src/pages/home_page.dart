import 'package:flutter/material.dart';
import 'package:user_preferens/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'Home';

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(title: Text('Preferencias de usuario.'),),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
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