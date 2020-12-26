import 'package:flutter/material.dart';
import 'package:user_preferens/src/pages/home_page.dart';
import 'package:user_preferens/src/pages/setting_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
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