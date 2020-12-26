import 'package:flutter/material.dart';
import 'package:user_preferens/src/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'Settings';

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(title: Text('Ajustes'),),
      body: Center(
        child: Text('Ajustes Page'),
      )
    );
  }
}