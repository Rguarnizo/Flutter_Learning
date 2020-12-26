import 'package:flutter/material.dart';
import 'package:user_preferens/src/pages/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'Home';

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      drawer: _drawer(context),
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

  _drawer(context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/Images/menu-img.jpg'),fit: BoxFit.cover),
            ),),
          ),
          ListTile(
            leading: Icon(Icons.pages,color: Colors.blue),
            title: Text('Pages'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.party_mode,color: Colors.blue),
            title: Text('People'),
            onTap: (){
              
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.blue),
            title: Text('Settings'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context,SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}